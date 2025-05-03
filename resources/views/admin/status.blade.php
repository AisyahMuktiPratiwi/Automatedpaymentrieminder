@extends('layout.admin')

@section('content')

<style>
    #myTable {
        border-collapse: collapse;
        width: 100%;
    }

    #myTable th {
        border-bottom: 1px solid #7dacd8;
        border-top: 1px solid #7dacd8;
    }

    #myTable td {
        border-bottom: 1px solid rgb(68, 67, 67);
    }

    select, button {
        background-color:rgb(230, 230, 227);
        color: #7dacd8;
        border: 1px solid #7dacd8;
        padding: 4px 8px;
        border-radius: 4px;
    }

    select {
        margin-right: 10px;
    }

    button:hover {
        background-color: #7dacd8;
        color: #ffffff;
    }

    /* Responsive table styling */
    @media (max-width: 768px) {
        .table-responsive-md {
            overflow-x: auto;
        }
        #myTable th, #myTable td {
            white-space: nowrap;
        }
    }

    /* Pagination Styling */
    .pagination {
        justify-content: center;
        margin-top: 20px;
    }

    .page-link {
        color: #7dacd8;
        border-color: #7dacd8;
    }

    .page-item.active .page-link {
        background-color: #7dacd8;
        border-color: #7dacd8;
        color: #fff;
    }

    .page-link:hover {
        background-color: #7dacd8;
        color: white;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div class="content-wrapper" style="background-color:rgb(231, 231, 231)">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <div class="card" style="background-color :rgb(231, 231, 231); box-shadow: #7dacd8 5px 6px 12px;">
                        <div class="card-body">
                            <h1 style="text-align:center; color: rgb(156, 161, 189); font-family: 'Quintessential', cursive;"><b>Data Penghuni</b></h1>
                        </div>
                    </div>
                    <div class="col-sm-6 text-end">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}" style="color:rgb(179, 179, 179)">Home</a></li>
                            <li class="breadcrumb-item active" style="color: rgb(98, 108, 173)">Data Penghuni</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
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

        <div class="card" style="box-shadow: #7dacd8 5px 6px 12px; background-color: rgb(231, 231, 231);">
            <div class="card-body">
                <div class="table-responsive-md">
                    <table id="myTable" class="table table-striped" style="color:  rgb(146, 153, 197)">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama</th>
                                <th>No HP</th>
                                <th>Tanggal Sewa</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody style="color: rgb(85, 85, 85)">
                            @foreach($pelanggans as $pelanggan)
                            <tr>
                                <td>{{ ($pelanggans->currentPage() - 1) * $pelanggans->perPage() + $loop->iteration }}</td>

                                <td>{{ $pelanggan->nama }}</td>
                                <td>{{ $pelanggan->nohp }}</td>
                                <td>{{ $pelanggan->tanggal_mulai_sewa }}</td>
                                <td>
                                    <form action="{{ route('pelanggan.updateStatus', $pelanggan->id) }}" method="POST" style="display: flex; align-items: center;">
                                        @csrf
                                        <select name="status">
                                            <option value="aktif" {{ $pelanggan->status == 'aktif' ? 'selected' : '' }}>Aktif</option>
                                            <option value="nonaktif" {{ $pelanggan->status == 'nonaktif' ? 'selected' : '' }}>Nonaktif</option>
                                        </select>
                                        <button type="submit">Ubah</button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <p class="text-end text-muted">Total data: {{ $pelanggans->total() }}</p>
                <div class="d-flex justify-content-end mt-4">
                    {{ $pelanggans->links('pagination::bootstrap-4') }}
                </div>

            </div>
        </div>
    </div>
</div>
@endsection
