<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use App\Models\Department;
use Spatie\Permission\Models\Permission;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Permission::insert([
            [
                "name" => "Ver usuarios",
                "guard_name" => "web",
            ],
            [
                "name" => "Crear usuarios",
                "guard_name" => "web",
            ],
            [
                "name" => "Editar usuarios",
                "guard_name" => "web",
            ],
            [
                "name" => "Eliminar usuarios",
                "guard_name" => "web",
            ],
            [
                "name" => "Ver roles",
                "guard_name" => "web",
            ],
            [
                "name" => "Crear roles",
                "guard_name" => "web",
            ],
            [
                "name" => "Editar roles",
                "guard_name" => "web",
            ],
            [
                "name" => "Eliminar roles",
                "guard_name" => "web",
            ],
        ]);
    }
}
