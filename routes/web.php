<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\FasilitasController;
use App\Http\Controllers\PelangganController;
use App\Http\Controllers\PembayaranController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/', [PelangganController::class, 'index'])->name('depan.index');
Route::get('penghuni/create', [PelangganController::class, 'create'])->name('pelanggan.create');
Route::post('penghuni/store', [PelangganController::class, 'store'])->name('pelanggan.store');
Route::get('pembayaran/sukses', [PelangganController::class, 'sukses'])->name('pembayaran.sukses');



Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');  // GET untuk menampilkan form
Route::post('/login', [AuthController::class, 'login']);  // POST untuk memproses login
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

Route::get('/dashboardpenghuni', [PembayaranController::class, 'dashboard'])
    ->middleware('auth:pelanggan')
    ->name('dashboard');

Route::post('/upload-bukti', [PembayaranController::class, 'uploadBukti'])->name('upload.bukti');



// Login Admin
Route::get('/admin/login', [AuthController::class, 'showAdminLoginForm'])->name('admin.login');
Route::post('/admin/login', [AuthController::class, 'adminLogin'])->name('admin.login.submit');

// Dashboard & history hanya untuk admin
Route::middleware(['auth:admin'])->group(function () {
    Route::get('/admin/dashboard', [AdminController::class, 'index'])->name('admin.dashboard');

    Route::post('/admin/logout', [AuthController::class, 'adminLogout'])->name('admin.logout');

     // Status pelanggan dikelola oleh admin
     Route::get('/admin/datapenghuni', [AdminController::class, 'showStatusForm'])->name('pelanggan.status');

     Route::post('/admin/penghuni/{id}/update-status', [AdminController::class, 'updateStatus'])->name('pelanggan.updateStatus');

     Route::get('/admin/datapembayaran', [AdminController::class, 'showPembayaran'])->name('admin.showPembayaran');
     Route::get('/pembayaran/filter', [AdminController::class, 'showPembayaran'])->name('pembayaran.filter');
     // konfirmasi pembayaran juga oleh admin
     Route::post('/admin/pembayaran/konfirmasi/{id}', [AdminController::class, 'konfirmasiPembayaran'])->name('pembayaran.konfirmasi');


     Route::resource('fasilitas', FasilitasController::class);


    });


