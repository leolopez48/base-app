<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = Role::create(['name' => 'Administrador']);
        $user = Role::create(['name' => 'Usuario']);

        $permissions = Permission::all();

        // Creating the admin role
        foreach ($permissions as $permission) {
            $admin->givePermissionTo($permission);
        }

        $user->givePermissionTo(['Ver usuarios']);
    }
}
