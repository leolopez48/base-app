<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements MustVerifyEmail, JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles, SoftDeletes;

    public $incrementing = true;

    // protected $data = ['deleted_at'];

    protected $fillable = [
        'id',
        'name',
        'surname',
        'dui',
        'email',
        'password',
        'email_verified_at',
    ];

    protected $hidden = [
        'password',
        'created_at',
        'updated_at',
        'remember_token',
        'email_verified_at',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function sendEmailVerificationNotification()
    {
        $this->notify(new \App\Notifications\VerifyEmailQueued);
    }

    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

    public $timestamps = true;

    public static function allDataSearched($search, $sortBy, $sort, $skip, $itemsPerPage)
    {
        return User::select('users.*', 'users.id as id')
        ->where('users.name', 'like', $search)
        ->orWhere('users.surname', 'like', $search)
        ->orWhere('users.email', 'like', $search)
        ->skip($skip)
        ->take($itemsPerPage)
        ->orderBy("users.$sortBy", $sort)
        ->get();
    }

    public static function counterPagination($search)
    {
        return User::select('users.*', 'users.id as id')
        ->where('users.name', 'like', $search)
        ->orWhere('users.surname', 'like', $search)
        ->orWhere('users.email', 'like', $search)
        ->count();
    }
}
