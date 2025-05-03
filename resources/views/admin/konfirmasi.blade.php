@extends('layout.admin')

@section('content')

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
    }

    h2 {
        color: #333;
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    #myTable th {
        border-bottom: 1px solid #7dacd8;
        border-top: 1px solid #7dacd8;
    }

    td {
        color: #555;
    }

    .btn-konfirmasi {
        background-color: red;
        color: white;
        padding: 6px 12px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .btn-konfirmasi:hover {
        background-color: #db0000;
    }

    .label-sudah {
        background-color: none;
        color: green;
        padding: 6px 12px;
        border-radius: 4px;
        display: inline-block;
    }

    .bukti-bayar img {
        max-width: 150px;
        max-height: 100px;
        border: 1px solid #ccc;
    }

    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .pagination .page-item .page-link {
        color: #3498db;
        border: 1px solid #3498db;
        padding: 5px 10px;
    }

    .pagination .page-item.active .page-link {
        background-color: #3498db;
        color: white;
    }

    .pagination .page-item .page-link:hover {
        background-color: #2980b9;
        color: white;
    }

    @media (max-width: 768px) {
        .filter-form {
            flex-direction: column;
            gap: 10px;
        }
    }
</style>

<div class="content-wrapper" style="background-color:rgb(231, 231, 231)">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <div class="card" style="background-color:rgb(231, 231, 231); box-shadow: #7dacd8 5px 6px 12px;">
                        <div class="card-body">
                            <h1 style="text-align:center; color: rgb(156, 161, 189); font-family: 'Quintessential', cursive;"><b>Data Pembayaran</b></h1>
                        </div>
                    </div>
                    <div class="col-sm-6 text-end">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}" style="color:rgb(179, 179, 179)">Home</a></li>
                            <li class="breadcrumb-item active" style="color: rgb(98, 108, 173)">Data Pembayaran</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        @if(session('message'))
        <script>
            Swal.fire({
                title: 'Berhasil!',
                text: '{{ session('message') }}',
                icon: 'success',
                confirmButtonText: 'OK'
            });
        </script>
        @endif

        {{-- Filter Form --}}
        <form class="filter-form row mb-3" action="{{ route('pembayaran.filter') }}" method="GET">
            <div class="col-md-4 col-sm-12 mb-2">
                <select name="pelanggan_id" class="form-control">
                    <option value="">-- Pilih Pelanggan --</option>
                    @foreach($pelangganList as $pelanggan)
                        <option value="{{ $pelanggan->id }}" {{ request('pelanggan_id') == $pelanggan->id ? 'selected' : '' }}>
                            {{ $pelanggan->nama }}
                        </option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4 col-sm-12 mb-2">
                <input type="month" name="bulan" value="{{ request('bulan') }}" class="form-control" placeholder="Pilih Bulan" />
            </div>
            <div class="col-md-4 col-sm-12">
                <button type="submit" class="btn w-30" style="background-color:#7dacd8; color:white;">Filter</button>
            </div>
        </form>

        {{-- Tabel --}}
        <div class="card" style="box-shadow: #7dacd8 5px 6px 12px; background-color: rgb(231, 231, 231);">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="myTable" class="table table-striped" style="color:  rgb(146, 153, 197)">
                        <thead>
                            <tr>
                                <th>Nama Pelanggan</th>
                                <th>Bulan Pembayaran</th>
                                <th>Tanggal Pembayaran</th>
                                <th>Bukti Pembayaran</th>
                                <th>Status Pembayaran</th>
                                <th>Status Konfirmasi</th>
                                <th>Bulan Belum Dibayar</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($pembayarans as $pembayaran)
                                <tr>
                                    <td>{{ $pembayaran->pelanggan->nama }}</td>
                                    <td>{{ \Carbon\Carbon::parse($pembayaran->bulan)->format('F Y') }}</td>
                                    <td>
                                        {{ $pembayaran->tanggal_pembayaran ? \Carbon\Carbon::parse($pembayaran->tanggal_pembayaran)->format('d-m-Y') : '-' }}
                                    </td>
                                    <td class="bukti-bayar">
                                        @if($pembayaran->bukti_bayar)
                                            <a href="{{ asset('storage/' . $pembayaran->bukti_bayar) }}" target="_blank">
                                                <img src="{{ asset('storage/' . $pembayaran->bukti_bayar) }}" alt="Bukti Pembayaran">
                                            </a>
                                        @else
                                            <span>Tidak ada bukti</span>
                                        @endif
                                    </td>
                                    <td>{{ ucfirst($pembayaran->status_pembayaran) }}</td>
                                    <td>
                                        @if($pembayaran->konfirmasi === 'menunggu konfirmasi')
                                            <form action="{{ route('pembayaran.konfirmasi', $pembayaran->id) }}" method="POST">
                                                @csrf
                                                <button type="submit" class="btn-konfirmasi">Konfirmasi</button>
                                            </form>
                                        @elseif($pembayaran->konfirmasi === 'sudah di konfirmasi')
                                            <span class="label-sudah">Sudah Dikonfirmasi</span>
                                        @else
                                            <span style="color:gray;">Status Tidak Diketahui</span>
                                        @endif
                                    </td>
                                    <td>
                                        @php
                                            $belumDibayar = $semuaBulan[$pembayaran->pelanggan_id] ?? [];
                                            echo empty($belumDibayar)
                                                ? 'Tidak Ada Tunggakan'
                                                : implode(', ', array_map(fn($bulan) => \Carbon\Carbon::parse($bulan)->translatedFormat('F Y'), $belumDibayar));
                                        @endphp
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <p class="text-end text-muted">Total data: {{ $pembayarans->total() }}</p>
                    <div class="d-flex justify-content-end mt-4">
                        {{ $pembayarans->links('pagination::bootstrap-4') }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
