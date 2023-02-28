<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use DB;
use Hash;
use Spatie\Permission\Models\Role;
use Encrypt;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // Verify permission
        $data = RoleController::verifyPermission('Ver usuarios');
        if (!$data['success']) {
            return response()->json($data);
        }

        $itemsPerPage = $request->itemsPerPage;
        $skip = 0;

        if (($request->itemsPerPage == -1)) {
            $itemsPerPage =  Category::count();
            $skip = ($request->page - 1) * $request->itemsPerPage;
        }

        $sortBy = (isset($request->sortBy[0])) ? $request->sortBy[0] : 'id';
        $sort = (isset($request->sortDesc[0])) ? "asc" : 'desc';

        $search = (isset($request->search)) ? "%$request->search%" : '%%';

        $users = User::allDataSearched($search, $sortBy, $sort, $skip, $itemsPerPage);

        // Getting role
        foreach ($users as $user) {
            $user->rol = $user->getRoleNames()[0];
        }

        $users = Encrypt::encryptObject($users, "id");

        $total = User::counterPagination($search);

        return response()->json([
            "success" => true,
            "status" => 200,
            "response" => "success",
            "message"=>"Usuarios obtenidos correctamente.",
            "users" => $users,
            "total" => $total,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user = count(User::where(["email"=>$request->email])->get());

        if ($user > 0) {
            return response()->json([
                "success" => false,
                "status" => 200,
                "response" => "success",
                "message"=>"Este email ya existe."
            ]);
        }

        $password = Hash::make($request->password);

        $user = new User();
        $user->name = $request->name;
        $user->last_name = $request->last_name;
        $user->dui = $request->dui;
        $user->email = $request->email;
        $user->email_verified_at = now();
        $user->password = $password;

        $user->save();

        $role = Role::where("name", $request->rol)->first();
        $user->assignRole($role);

        return response()->json([
            "success" => true,
            "status" => 200,
            "message"=>"Registro creado correctamente."
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $id = Encrypt::decryptValue($request->id);
        $user = User::find($id);

        $password = Hash::make($request->password);

        $data = [
            "name" => $request->name,
            "lastName" => $request->lastName,
            "email" => $request->email,
            "password" => $password,
        ];

        if (isset($request->rol)) {
            $oldRole = DB::table("model_has_roles")->where("model_id", $user->id)->delete();

            $role = Role::where("name", $request->rol)->first();
            $user->assignRole($role);
        }

        $user->update($data);

        return response()->json([
            "success" => true,
            "status" => 200,
            "response" => "success",
            "message"=>"Registro actualizado correctamente."
        ]);
    }

    /**
     * Gets the specified user resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function actualUser(Request $request)
    {
        $user = User::find(auth()->user()->id);

        return response()->json([
            "success" => true,
            "status" => 200,
            "response" => "success",
            "message"=>"Registro obtenido correctamente.",
            "user"=> $user
        ]);
    }

    /**
     * Gets the specified user resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function block(Request $request)
    {
        $users = $request->users;
        $state = $request->state;

        foreach ($users as $user) {
            $user = User::withTrashed()->find(Encrypt::decryptValue($user['id']));

            ($state == "Block") ? $user->delete() : $user->restore();
        }

        $stateMessage = ($state == "Block") ? "bloqueados" : "activados";

        return response()->json([
            "success" => true,
            "status" => 200,
            "response" => "success",
            "message"=>"Usuarios $stateMessage correctamente."
        ]);
    }
}
