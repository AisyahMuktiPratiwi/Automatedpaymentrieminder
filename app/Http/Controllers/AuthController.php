<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\Pelanggan;

class AuthController extends Controller
{
    // Menampilkan halaman login
    public function showLoginForm()
    {
        return view('auth.login');
    }

    // Proses login
    public function login(Request $request)
    {
        // Validasi input
        $validated = $request->validate([
            'nohp' => 'required|numeric',
            'password' => 'required|min:8',
        ]);

        // Autentikasi dengan guard yang sesuai
        $credentials = $request->only('nohp', 'password');

        if (Auth::guard('pelanggan')->attempt($credentials)) {
            return redirect()->route('dashboard');
        }

        return back()->with('error', 'Nomor HP atau password salah');
    }

    // Logout
    public function logout()
    { Auth::guard('pelanggan')->logout();
        return redirect()->route('login');
    }



    // Tampilkan form login admin
public function showAdminLoginForm()
{
    return view('auth.admin-login');
}

// Proses login admin
public function adminLogin(Request $request)
{
    $request->validate([
        'nohp' => 'required',
        'password' => 'required',
    ]);

    $credentials = $request->only('nohp', 'password');

    if (Auth::guard('admin')->attempt($credentials)) {
        return redirect()->route('admin.dashboard');
    }

    return back()->with('error', 'Nomor HP atau password salah');
}

// Logout admin
public function adminLogout(Request $request)
{
    Auth::guard('admin')->logout();
    return redirect()->route('admin.login');
}

}
