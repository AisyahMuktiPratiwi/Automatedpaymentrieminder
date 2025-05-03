<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pendaftaran dan Pembayaran Kontrakan</title>
</head>
<body>
    <h2>Pendaftaran dan Pembayaran Kontrakan</h2>

    <!-- Menampilkan pesan error jika ada validasi yang gagal -->
    @if ($errors->any())
        <div style="color: red;">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <!-- Formulir Pendaftaran Pelanggan -->
    <form action="{{ route('pelanggan.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div>
            <label for="nama">Nama</label>
            <input type="text" name="nama" value="{{ old('nama') }}" required>
        </div>
        <div>
            <label for="nohp">Nomor HP</label>
            <input type="text" name="nohp" value="{{ old('nohp') }}" required>
        </div>
        <div>
            <label for="password">Password</label>
            <input type="password" name="password" required>
        </div>
        <div>
            <label for="tanggal_mulai_sewa">Tanggal Mulai Sewa</label>
            <input type="date" name="tanggal_mulai_sewa" value="{{ old('tanggal_mulai_sewa') }}" required>
        </div>
        <div>
            <label for="bukti_bayar">Bukti Pembayaran</label>
            <input type="file" name="bukti_bayar" required>
        </div>
        <div>
            <button type="submit">Daftar dan Kirim Bukti Pembayaran</button>
        </div>
    </form>
</body>
</html>
