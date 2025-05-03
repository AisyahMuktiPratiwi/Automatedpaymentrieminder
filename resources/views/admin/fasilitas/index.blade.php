@extends('layout.admin')

@section('content')

<style>

.modal-content {
    background-color: rgba(125, 172, 216, 0.9); /* #7dacd8 dengan transparansi */
    color: white;
    border: none;
    border-radius: 10px;
}

.modal-header, .modal-body, .modal-footer {
    color: white;
}

.modal-backdrop.show {
    opacity: 0.1;
   /* Latar belakang gelap yang lebih transparan */
}

    .btn-circle {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background-color:#7dacd8; /* biru */
        color: white;              /* putih */
        width: 60px;
        height: 60px;
        border-radius: 50%;
        font-size: 18px;
        text-decoration: none;
        border: none;
        transition: 0.3s;
    }

    .btn-circle:hover {
        background-color: #0056b3;
        color: #fff;
    }

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

    .btn-custom {
        background-color: transparent;
        color: #7dacd8;
        border: 1.5px solid #7dacd8;
        padding: 6px 12px;
        border-radius: 25px;
        font-weight: 500;
        text-decoration: none;
        transition: 0.3s ease-in-out;
    }

    .btn-custom:hover {
        background-color: #7dacd8;
        color: #ffffff;
    }

    .action-btn {
        background-color: transparent;
        border: none;
        color: #7dacd8;
        font-size: 18px;
        transition: 0.2s;
    }

    .action-btn:hover {
        color: #ffffff;
        background-color: #7dacd8;
        border-radius: 50%;
        padding: 4px 8px;
    }

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

    .top-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div class="content-wrapper" style="background-color: rgb(231, 231, 231)">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <div class="card" style="background-color: rgb(231, 231, 231); box-shadow: #7dacd8 5px 6px 12px;">
                        <div class="card-body">
                            <h1 style="text-align:center; color: rgb(156, 161, 189); font-family: 'Quintessential', cursive;"><b>Data Fasilitas</b></h1>
                        </div>
                    </div>
                    <div class="col-sm-6 text-end">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}" style="color:rgb(179, 179, 179)">Home</a></li>
                            <li class="breadcrumb-item active" style="color: rgb(98, 108, 173)">Data Fasilitas</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        @if(session('success'))
            <script>
                Swal.fire({
                    title: 'Berhasil!',
                    text: '{{ session('success') }}',
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
                                <th>Nama Fasilitas</th>
                                <th>Deskripsi</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody style="color: rgb(85, 85, 85)">
                            @foreach($fasilitas as $index => $item)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $item->nama_fasilitas }}</td>
                                <td>{{ $item->deskripsi }}</td>
                                <td style="display: flex; gap: 5px;">
                                    <!-- Tombol untuk membuka modal edit -->
                                  <a href="#" class="btn btn-outline-warning rounded" data-bs-toggle="modal" data-bs-target="#editFasilitasModal{{ $item->id }}" title="Edit">
                                        <i class="fas fa-edit"></i>
                                    </a>

                                    <form action="{{ route('fasilitas.destroy', $item->id) }}" method="POST" onsubmit="return confirm('Yakin ingin hapus?')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-outline-danger rounded" title="Hapus">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <!-- Modal Edit Fasilitas Per Baris -->
<div class="modal fade" id="editFasilitasModal{{ $item->id }}" tabindex="-1" aria-labelledby="editFasilitasModalLabel{{ $item->id }}" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editFasilitasModalLabel{{ $item->id }}">Edit Fasilitas</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="{{ route('fasilitas.update', $item->id) }}" method="POST">
                    @csrf
                    @method('PUT')

                    <div class="mb-3">
                        <label for="nama_fasilitas" class="form-label">Nama:</label>
                        <input type="text" name="nama_fasilitas" class="form-control" value="{{ $item->nama_fasilitas }}" required>
                    </div>

                    <div class="mb-3">
                        <label for="deskripsi" class="form-label">Deskripsi:</label>
                        <textarea name="deskripsi" class="form-control" required>{{ $item->deskripsi }}</textarea>
                    </div>

                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>
                        @endforeach

                        </tbody>
                    </table>
                </div>
                <div class="top-bar d-flex justify-content-between align-items-center mb-3 mt-3">
                    <div></div>
                    <!-- Tombol untuk membuka modal -->
                    <a href="#" class="btn-circle" data-bs-toggle="modal" data-bs-target="#tambahFasilitasModal" title="Tambah Fasilitas">
                        <i class="fas fa-plus"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Tambah Fasilitas -->
<div class="modal fade" id="tambahFasilitasModal" tabindex="-1" aria-labelledby="tambahFasilitasModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahFasilitasModalLabel">Tambah Fasilitas</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="{{ route('fasilitas.store') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="nama_fasilitas" class="form-label">Nama:</label>
                        <input type="text" name="nama_fasilitas" id="nama_fasilitas" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="deskripsi" class="form-label">Deskripsi:</label>
                        <textarea name="deskripsi" id="deskripsi" class="form-control" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </form>
            </div>
        </div>
    </div>
</div>







@endsection
