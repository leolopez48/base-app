<?php

namespace App\Models;

use Encrypt;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class CustomRole extends Role
{
    use HasFactory;

    protected $table = 'roles';

    public $incrementing = true;

    protected $fillable = [
        'name',
        'guard_name',
    ];

    public $timestamps = false;

    public function format()
    {
        return [
            'id' => Encrypt::encryptValue($this->id),
            'name' => $this->name,
            'guard_name' => $this->guard_name,
            'permissions' => $this->getAllPermissions()->map(fn ($perm) => [
                'id' => Encrypt::encryptValue($this->id),
                'name' => $perm->name,
                'guard_name' => $this->guard_name,
                'checked' => true,
            ]),
        ];
    }

    public static function pagination($search = "", $sortBy, $sort, $skip, $itemsPerPage)
    {
        return CustomRole::where('name', 'like', $search)
        ->orderBy($sortBy, $sort)
        ->get()
        ->map(fn ($role) => $role->format());
    }

    public static function counter($search = "")
    {
        return CustomRole::where('name', 'like', $search)
        ->count();
    }
}
