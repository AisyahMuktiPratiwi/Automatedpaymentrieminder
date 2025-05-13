@extends('layout.penghuni')

@section('content')

<style>
/* Modal content background & style */
#uploadModal .modal-content {
    background-color: rgba(125, 172, 216, 0.9) !important; /* transparan */
    color: white !important;
    border: none !important;
    border-radius: 10px !important;
}

/* Warna teks di header, body, footer */
#uploadModal .modal-header,
#uploadModal .modal-body,
#uploadModal .modal-footer {
    color: white !important;
}

/* Atur latar belakang gelap modal menjadi lebih transparan */
.modal-backdrop.show {
    opacity: 0.1 !important;
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

    @media (max-width: 768px) {
        .table-responsive-md {
            overflow-x: auto;
        }
        #myTable th, #myTable td {
            white-space: nowrap;
        }
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
                            <h1 style="text-align:center; color: rgb(156, 161, 189); font-family: 'Quintessential', cursive;"><b>Riwayat Pembayaran</b></h1>
                        </div>
                    </div>
                    {{-- <div class="col-sm-6 text-end">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}" style="color:rgb(179, 179, 179)">Home</a></li>
                            <li class="breadcrumb-item active" style="color: rgb(98, 108, 173)">Riwayat Pembayaran</li>
                        </ol>
                    </div> --}}
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <div class="card" style="box-shadow: #7dacd8 5px 6px 12px; background-color: rgb(231, 231, 231);">
            <div class="card-body">
                <!-- Tombol untuk buka modal -->
                <div class="text-end mt-4 mb-4">
                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#uploadModal"
                        style="background-color:#7dacd8; color: white; border: 1px solid #7dacd8; padding: 4px 8px; border-radius: 4px;">
                       + Upload Pembayaran
                    </button>

                    <p for="text" class="font-bold text-lg  text-end mb-1 mt-1 cursor-pointer" style="color: rgb(100, 96, 90); ">No Rekening: 7115101641</p>

                </div>

                <div class="table-responsive-md">
                    <table id="myTable" class="table table-striped" style="color:  rgb(146, 153, 197)">
                        <thead>
                            <tr>
                                <th>Bulan</th>
                                <th>Status</th>
                                <th>Konfirmasi</th>
                                <th>Tanggal Bayar</th>
                                <th>Bukti</th>
                            </tr>
                        </thead>
                        <tbody style="color: rgb(85, 85, 85)">
                            @foreach($histori as $row)
                                <tr>
                                    <td>{{ \Carbon\Carbon::parse($row->bulan)->translatedFormat('F Y') }}</td>
                                    <td>{{ $row->status_pembayaran }}</td>
                                    <td>{{ $row->konfirmasi }}</td>
                                    <td>{{ $row->tanggal_pembayaran ?? '-' }}</td>
                                    <td>
                                        @if($row->bukti_bayar)
                                           <a href="{{ asset('storage/' . $row->bukti_bayar) }}" target="_blank">
                                        <img src="{{ asset('storage/' . $row->bukti_bayar) }}" alt="Bukti" width="80" height="80" style="object-fit: cover; border-radius: 6px;">
                                           </a>
                                    @else
                                        -
                                    @endif

                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                        <p class="text-end text-muted">Total data: {{ $histori->total() }}</p>
                    <div class="d-flex justify-content-end mt-4">
                        {{ $histori->links('pagination::bootstrap-4') }}
                    </div>
                </div>


                <!-- Modal Form Upload -->
                <div class="modal fade" id="uploadModal" tabindex="-1" aria-labelledby="uploadModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" style="background-color: rgb(240, 240, 240);">
                            <div class="modal-header">
                                <h5 class="modal-title" id="uploadModalLabel" style="color:#7dacd8;">Form Upload Bukti Pembayaran</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form method="POST" action="{{ route('upload.bukti') }}" enctype="multipart/form-data">
                                @csrf
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="bulan" class="form-label">Bulan Pembayaran:</label>
                                        <select name="bulan" class="form-select" required>
                                            @foreach($semuaBulan as $bulan)
                                                <option value="{{ $bulan }}">{{ \Carbon\Carbon::parse($bulan)->translatedFormat('F Y') }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="bukti_bayar" class="form-label">Upload Bukti:</label>
                                        <input type="file" name="bukti_bayar" class="form-control" accept="image/*" required  onchange="validateImageFile(this)">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                    <button type="submit" class="btn" style="background-color:rgb(38, 91, 160); color:white;">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    function validateImageFile(input) {
        const file = input.files[0];
        if (file && !file.type.startsWith('image/')) {
            alert('Hanya file gambar yang diperbolehkan (jpg, jpeg, png, dll)');
            input.value = ''; // Reset input file
        }
    }
</script>

@endsection
