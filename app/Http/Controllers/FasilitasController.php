<?php

namespace App\Http\Controllers;

use App\Models\Fasilitas;
use Illuminate\Http\Request;

class FasilitasController extends Controller
{
    public function index()
    {
        $fasilitas = Fasilitas::all();
        return view('admin.fasilitas.index', compact('fasilitas'));
    }

    public function create()
    {
        return view('admin.fasilitas.index');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_fasilitas' => 'required|max:100',
            'deskripsi' => 'required',
        ]);

        Fasilitas::create($request->all());

        return redirect()->route('fasilitas.index')->with('success', 'Fasilitas berhasil ditambahkan.');
    }

    public function edit($id)
    {
        $fasilita = Fasilitas::findOrFail($id); // Mengambil data fasilitas berdasarkan ID
        return view('admin.fasilitas.index', compact('fasilita')); // Kirim variabel $fasilita ke view
    }

    public function update(Request $request, Fasilitas $fasilita)
    {
        // Validasi input
        $request->validate([
            'nama_fasilitas' => 'required|max:100',
            'deskripsi' => 'required',
        ]);

        // Update data fasilitas
        $fasilita->update([
            'nama_fasilitas' => $request->nama_fasilitas,
            'deskripsi' => $request->deskripsi,
        ]);

        // Redirect ke halaman fasilitas index dengan pesan sukses
        return redirect()->route('fasilitas.index')->with('success', 'Fasilitas berhasil diperbarui.');
    }


    public function destroy(Fasilitas $fasilita)
    {
        $fasilita->delete();

        return redirect()->route('fasilitas.index')->with('success', 'Fasilitas berhasil dihapus.');
    }
}
