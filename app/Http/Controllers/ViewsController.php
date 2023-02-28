<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ViewsController extends Controller
{
    public function home()
    {
        return view('home');
    }

    /**
     *
     * Administration option
     *
     */
    public function user()
    {
        return view('administration.user');
    }

    public function role()
    {
        return view('administration.role');
    }
}
