<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <title>Konntrami</title>
  <script src="https://cdn.tailwindcss.com"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"/>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter&display=swap');
    @keyframes blink {
    0%, 100% { opacity: 1; }
    50% { opacity: 0; }
  }
  .fade-in-right {
  opacity: 0;
  transform: translateY(20px); /* Untuk fade-in-up */
  transition: opacity 0.8s ease-out, transform 0.8s ease-out;
  will-change: transform, opacity;
}

.fade-in-right {
  transform: translateX(20px); /* Untuk fade-
  in-right */
}

.visible {
  opacity: 1;
  transform: translateY(0) translateX(0);
}
  .flip-on-scroll {
  opacity: 0;
  transform: rotateY(90deg);
  transition: opacity 1s ease-out, transform 1s ease-out;
}

.flip-on-scroll.visible {
  opacity: 1;
  transform: rotateY(0deg);
}
.image-wrapper {
  position: relative;
  width: 250px;
  margin: 30px auto;
  overflow: hidden;
}

.scroll-image {
  width: 100%;
  display: block;
  position: relative;
  z-index: 1;
}

.curtain-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 119, 255, 0.4); /* Biru transparan */
  transform: translateY(0%);
  transition: transform s ease-in-out;
  z-index: 2;
  pointer-events: none;
}

.image-wrapper.animate-up .curtain-overlay {
  transform: translateY(-0%);
}

.image-wrapper.animate-down .curtain-overlay {
  transform: translateY(0%);
}


    body {
      font-family: 'Inter', sans-serif;
      background-color: #e7e7e7ef;
      scroll-behavior: smooth; /* Enable smooth scrolling */
    }
    h1 {
     font-family: 'Playfair Display', serif;
   }

    /* Custom underline for active link */
    .active-link {
      text-decoration: underline;
      text-underline-offset: 4px;
    }
    .icon-custom, .text-custom {
      color: rgb(216, 202, 187);
      transition: color 0.3s;
    }
    .service-box {
      transition: background-color 0.3s;
    }
    .service-box:hover {
      background-color: rgb(216, 202, 187);
    }
    .service-box:hover .icon-custom,
    .service-box:hover .text-custom {
      color: white;
    }

    /* Scroll animations */
    .fade-in-up {
      opacity: 0;
      transform: translateY(20px);
      transition: opacity 0.5s ease-out, transform 0.5s ease-out;
    }

    .fade-in-up.visible {
      opacity: 1;
      transform: translateY(0);
    }
       /* Container skew to create parallelogram layout */
       .parallelogram-container {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 0.25rem;
        max-width: 960px;
        width: 100%;
      }
      /* Each image skewed to form parallelogram shape */
      .parallelogram-container img {
        width: 140%;
        height: auto;
        border-radius: 0.375rem;
        object-fit: cover;
        clip-path: polygon(20% 0%, 100% 0%, 80% 100%, 0% 100%);
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        transition: transform 0.3s ease;
      }
      .parallelogram-container img:hover {
        transform: scale(1.05);
      }
      /* Card styling */
      .card {
        padding: 0.75rem;
        height: 9rem;
        width: 12rem;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        border-radius: 0.5rem;
        box-shadow: 0 4px 6px rgb(216, 202, 187);
        background-color:  rgb(240, 240, 240);
        margin-bottom: 0.5rem;
      }
      .card-title {
        font-size: 1rem;
        font-weight: 600;
        margin-bottom: 0.5rem;
        color: rgb(112, 109, 105);
      }
      .card-text {
        font-size: 0.875rem;
        color:rgb(112, 109, 105);
        line-height: 1.4;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 4;
        -webkit-box-orient: vertical;
      }
      @media (max-width: 640px) {
        .cards-container {
          display: grid !important;
          grid-template-columns: repeat(2, 1fr) !important;
          gap: 0.5rem !important;
          max-width: 100% !important;
        }
        .card {
          width: 100% !important;
          height: 9rem !important;
          margin-bottom: 0 !important;
        }
        .card-title {
          font-size: 0.875rem;
        }
        .card-text {
          font-size: 0.75rem;
          -webkit-line-clamp: 3;
        }
        /* Added to reduce h1 size on mobile */
        h1.text-5xl {
          font-size: 2rem !important;
          line-height: 1.2 !important;
        }
        p{
          font-size: small;
        }
        /* Force parallelogram container to keep 2 columns on mobile */
        .parallelogram-container {
          grid-template-columns: repeat(2, 1fr) !important;
          gap: 0.5rem !important;
          max-width: 100% !important;
        }
        .parallelogram-container img {
          width: 100% !important;
          clip-path: polygon(20% 0%, 100% 0%, 80% 100%, 0% 100%) !important;
        }
        .image-wrapper {
          width: 100% !important;
          margin: 0 !important;
        }
        .parallelogram-container.flex.flex-wrap.gap-4 {
          display: grid !important;
          grid-template-columns: repeat(2, 1fr) !important;
          gap: 0.5rem !important;
          max-width: 100% !important;
        }
      }
      /* Reduced gap between cards */
      .cards-container {
        display: flex;
        flex-wrap: wrap;
        max-width: 600px;
        gap: 0.5rem;
        align-content: center;
      }
      /* Adjust margin-top for second card to move it down */
      .card:nth-child(2) {
        margin-top: 1.5rem;
      }

      .map-container {
      width: 100%;
      max-width: 800px;
      margin: 0 auto;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }

    iframe {
      width: 100%;
      height: 450px;
      border: none;
    }
  </style>
</head>
<body class="relative min-h-screen bg-gray-100">
  <nav class="fixed top-0 left-0 right-0 z-20 bg-[#7dacd8]/90 shadow-md">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between items-center py-4">
        <div class="hidden md:flex space-x-8">
               <img src="{{ asset('template/dist/img/logu.png') }}"
                  width="30px">
          <a href="/" class="nav-link text-white font-semibold text-sm hover:text-[#d8cabb] transition-colors">Beranda</a>
          <a href="#layanan" class="nav-link text-white font-semibold text-sm hover:text-[#d8cabb] transition-colors">Layanan</a>
          <a href="#tentangkami" class="nav-link text-white font-semibold text-sm hover:text-[#d8cabb] transition-colors">Tentang Kami</a>
          <a href="#fasilitasruang" class="nav-link text-white font-semibold text-sm hover:text-[#d8cabb] transition-colors">Fasilitas</a>
        </div>
        <div class="hidden md:block">
          <a href="#" class="nav-link text-white font-semibold text-sm hover:text-[#d8cabb] transition-colors" aria-label="Login">
            <a href="{{ route('login') }}" class="flex items-center gap-2 text-white hover:text-[#d8cabb]">
                <i class="fas fa-sign-in-alt"></i>
                <span>Login</span>
            </a>

          </a>
        </div>
        <div class="md:hidden flex items-center">
          <button id="menu-btn" aria-label="Toggle menu" class="text-white focus:outline-none">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" >
              <path d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
          </button>
        </div>
      </div>
    </div>
    <div id="mobile-menu" class="hidden md:hidden bg-[#7dacd8]/90">
      <a href="#" class="block px-4 py-2 nav-link-mobile text-white font-semibold hover:text-[#d8cabb] transition-colors">Beranda</a>

      <a href="/" class="block px-4 py-2 nav-link-mobile text-white font-semibold hover:text-[#d8cabb] transition-colors">Layanan</a>
      <a href="#layanan" class="block px-4 py-2 nav-link-mobile text-white font-semibold hover:text-[#d8cabb] transition-colors">Tentang Kami</a>
      <a href="#tentangkami" class="block px-4 py-2 nav-link-mobile text-white font-semibold hover:text-[#d8cabb] transition-colors">Fasilitas</a>
      <a href="#fasilitasruang" class="block px-4 py-2 nav-link-mobile text-white font-semibold hover:text-[#d8cabb] transition-colors flex items-center space-x-2">
        <a href="{{ route('login') }}" class="flex items-center gap-2 text-blue-600 hover:text-blue-800">
            <i class="fas fa-sign-in-alt"></i>
            <span>Login</span>
        </a>

      </a>
    </div>
  </nav>

  <div class="relative pt-16">
    <!-- New Section for Welcome Text and WhatsApp Button -->
    <div class="absolute inset-0 flex flex-col items-center justify-center text-center px-4 z-10 fade-in-up">
      <h1 class="text-white text-2xl sm:text-3xl md:text-4xl font-bold drop-shadow-lg mb-2" style="font-family: Quintessential, serif;">Selamat Datang di Kontrami</h1>

      <p class="text-white text-sm sm:text-base md:text-lg drop-shadow-md max-w-2xl mb-4">
        Silakan Anda dapat melihat semua yang tersedia dalam kontrakan ini serta melakukan sewa. Jika ada yang ingin ditanyakan:
      </p>
      <a href="https://wa.me/6281382206488" target="_blank"  class="text-white font-semibold px-4 py-2 rounded-full flex items-center space-x-2 transition animate-[blink_1.5s_ease-in-out_infinite] mb-2" style="background-color: rgb(216, 202, 187);">
        <i class="fab fa-whatsapp text-lg"></i>
        <span>Hubungi Kami</span>
      </a>



  <h6 class="text-white text-l sm:text-xl md:text-2xl font-bold drop-shadow-lg " style="font-family: Quintessential, serif;">Hanya Mulai Dengan <span style="background-color: rgb(216, 202, 187)">Rp.500.000,00 </span></h6>
    <p  class="text-white text-sm sm:text-base md:text-lg drop-shadow-md max-w-2xl "> Segera Daftar !!!</p>

    </div>

  <img
  src="{{asset('images/kontrakan.jpeg')}}"
  alt="Wide banner background image with soft colors"
  class="w-full h-64 sm:h-80 md:h-96 lg:h-[500px] object-cover"
  width="1920"
  height="500"
  />
</div>

<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-16 relative z-10">
    <!-- Menampilkan pesan error jika ada validasi yang gagal -->

    @if (session('success'))
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Pendaftaran Berhasil',
            text: '{{ session('success') }}'
        });
    </script>
        @elseif(session('error'))
            <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Gagal',
                    text: '{{ session('error') }}'
                });
            </script>
        @endif

    <!-- Formulir Pendaftaran Pelanggan -->
    <form action="{{ route('pelanggan.store') }}" method="POST" enctype="multipart/form-data" class="bg-[#7dacd8]/90 rounded-lg p-6 w-full flex flex-wrap gap-x-6 gap-y-4 shadow-md justify-center md:justify-start items-end fade-in-up">
        @csrf

        <div class="flex flex-col w-full max-w-xs sm:max-w-sm md:w-44 fade-in-up">
            <label for="nama" class="font-bold text-sm mb-1 cursor-pointer text-white">Nama</label>
            <input id="nama" type="text" name="nama" value="{{ old('nama') }}" class="border border-white/70 bg-transparent rounded px-3 py-2 text-sm text-white placeholder-white focus:outline-none focus:ring-2 focus:ring-white" placeholder="Nama" required>
        </div>

        <div class="flex flex-col w-full max-w-xs sm:max-w-sm md:w-44 fade-in-up">
    <label for="nohp" class="font-bold text-sm mb-1 cursor-pointer text-white">Nomor HP</label>
    <input id="nohp" type="text" name="nohp" value="{{ old('nohp') }}" class="border border-white/70 bg-transparent rounded px-3 py-2 text-sm text-white placeholder-white focus:outline-none focus:ring-2 focus:ring-white" placeholder="gunakan 62" required oninput="validateNoHp()">
</div>



        <div class="flex flex-col w-full max-w-xs sm:max-w-sm md:w-44 fade-in-up">
            <label for="password" class="font-bold text-sm mb-1 cursor-pointer text-white">Password</label>
            <input id="password" type="password" name="password" class="border border-white/70 bg-transparent rounded px-3 py-2 text-sm text-white placeholder-white focus:outline-none focus:ring-2 focus:ring-white" placeholder="Password" required>
        </div>

        <div class="flex flex-col w-full max-w-xs sm:max-w-sm md:w-44 fade-in-up">
            <label for="tanggal_mulai_sewa" class="font-bold text-sm mb-1 cursor-pointer text-white">Tanggal Mulai Sewa</label>
            <input id="tanggal_mulai_sewa" type="date" name="tanggal_mulai_sewa" value="{{ old('tanggal_mulai_sewa') }}" class="border border-white/70 bg-transparent rounded px-3 py-2 text-sm text-white placeholder-white focus:outline-none focus:ring-2 focus:ring-white" required>
        </div>

        <div class="flex flex-col w-full max-w-xs sm:max-w-sm md:w-44 fade-in-up">
            <label for="bukti_bayar" class="font-bold text-sm mb-1 cursor-pointer text-white">Bukti Pembayaran</label>
            <input id="bukti_bayar" type="file" name="bukti_bayar" class="text-sm text-white" required  onchange="validateImageFile(this)">
            <p for="text" class="font-bold text-xs text-center mb-1 cursor-pointer" style="font-size: x-small; color: rgb(100, 96, 90); background-color: azure;">No Rekening: 7115101641</p>
        </div>

        <div class="flex items-end w-full max-w-xs sm:max-w-sm md:w-44 mx-auto fade-in-up">
            <button type="submit" class="rounded-full bg-[rgb(216,202,187)] text-white text-sm px-6 py-2 hover:bg-[rgb(200,190,175)] transition font-semibold animate-[blink_1.5s_ease-in-out_infinite]">
                Sewa sekarang
            </button>
        </div>

    </form>
    @if ($penuh)
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
        <strong class="font-bold">Kontrakan Penuh!</strong>
        <span class="block sm:inline">Untuk saat ini, pendaftaran sewa tidak tersedia karena semua unit telah terisi. Silakan cek kembali nanti.</span>
    </div>
    @endif
</main>


  <section class=" flex justify-center py-10" style="background-color: rgb(240, 240, 240)" id="layanan">
    <div class="max-w-7xl w-full px-4">
      <h1 class="text-3xl font-bold text-center mb-8" style="color:#7dacd8;">Apa yang Kontrami Tawarkan ? </h1>
      <div class="flex flex-wrap justify-center gap-6 max-w-6xl mx-auto w-full">
        <div class="service-box relative w-full sm:w-36 h-44 bg-white rounded-t-full rounded-br-full drop-shadow-md flex flex-col items-center pt-8 pb-6 px-6 fade-in-up">
          <i class="fas fa-video icon-custom text-4xl mb-4"></i>
          <p class="text-sm text-custom font-normal">Pemantauan Keamanan CCTV</p>
        </div>
        <div class="service-box relative w-full sm:w-36 h-44 bg-white rounded-t-full rounded-br-full drop-shadow-md flex flex-col items-center pt-8 pb-6 px-6 fade-in-up">
          <i class="fas fa-calendar-check icon-custom text-4xl mb-4"></i>
          <p class="text-sm text-custom font-normal">Kemudahan Sistem Sewa</p>
        </div>
        <div class="service-box relative w-full sm:w-36 h-44 bg-white rounded-t-full rounded-br-full drop-shadow-md flex flex-col items-center pt-8 pb-6 px-6 fade-in-up">
          <i class="fas  fa-tools icon-custom text-4xl mb-4"></i>
          <p class="text-sm text-custom font-normal">Layanan Bantuan</p>
        </div>
        <div class="service-box relative w-full sm:w-36 h-44 bg-white rounded-t-full rounded-br-full drop-shadow-md flex flex-col items-center pt-8 pb-6 px-6 fade-in-up">
          <i class="fas fa-road icon-custom text-4xl mb-4"></i>
          <p class="text-sm text-custom font-normal">Strategis</p>
        </div>
      </div>
    </div>
  </section>

  <div class="max-w-7xl mx-auto px-6 py-12 flex flex-col md:flex-row items-center md:items-center gap-12 md:gap-16 min-h-[480px] relative overflow-visible" id="tentangkami">
    <div class="md:w-3/5 order-1 md:order-1 relative flex justify-center md:justify-start overflow-visible  ">
     <div class="grid grid-cols-2 gap-4 max-w-[720px] rounded-md overflow-hidden relative z-10">
      <img alt=kontrami class="w-full h-auto object-cover rounded-md flip-on-scroll"  data-index="0" src="{{asset('images/kon4.jpeg')}}" />
      <img alt=kontrami class="w-full h-auto object-cover rounded-md flip-on-scroll"   data-index="0"src="{{asset('images/kon2.jpeg')}}" />
      <img alt=kontrami class="w-full h-auto object-cover rounded-md flip-on-scroll"  data-index="0" src="{{asset('images/kon3.jpeg')}}" />
      <img alt=kontrami class="w-full h-auto object-cover rounded-md flip-on-scroll"   data-index="0"src="{{asset('images/kon1.jpeg')}}" />
     </div>
     <img alt="Young woman with long brown hair eating salad in a cozy cafe with warm lighting" class="rounded-full border-4 border-white absolute w-44 h-44 object-cover shadow-lg transition-all duration-300 ease-in-out md:right-[-40px] md:-bottom-6 bottom-[-104px] left-1/2 md:left-auto transform -translate-x-1/2 md:translate-x-0 z-50 flip-on-scroll "  data-index="0"  src="images/konrakan.jpeg" />
    </div>

    <div class="md:w-2/5 order-2 md:order-2 text-center md:text-left flex flex-col justify-center h-full max-h-[480px] relative z-0 overflow-visible md:pl-6 fade-in-right ">
     <div class="pt-12 md:pt-0">

          <h1 class="text-5xl font-bold mb-6 leading-tight text-black" style="color: #7dacd8;">
          Apa itu Kontrami ?
          </h1>
            <p class="text-gray-600 text-base md:text-lg max-w-md mx-auto md:mx-0 mb-8 leading-relaxed" style="color:  rgb(153, 144, 134);text-align: justify;">
            Kontrami, tempat tinggal yang nyaman dan strategis untuk Anda!  Kami telah beroperasi sejak tahun 2017, menyediakan 15 pintu kontrakan dengan fasilitas yang sudah terjamin kualitasnya.

              Kontrami menawarkan kontrakan yang berlokasi di area yang sangat strategis, dekat dengan pusat industri, pasar, memberikan Anda kemudahan dalam mobilitas dan akses ke berbagai fasilitas umum.


            </p>

     </div>
    </div>
</div>


   <div class="max-w-7xl mx-auto px-6 py-12 flex flex-col md:flex-row items-center md:items-center gap-12 md:gap-16 min-h-[480px] relative overflow-visible fade-in-right" style="background-color: rgb(240, 240, 240)" id="fasilitasruang">

     <div class="max-w-6xl mx-auto px-6 py-6 flex flex-col md:flex-row gap-8 md:gap-16 min-h-[480px]">

      <div class="md:w-1/2 cards-container fade-in-up">
        <h1 class="text-5xl font-bold text-center mb-8" style="color:#7dacd8;">Fasilitas & Ruangan Tersedia </h1>
        @foreach ($fasilitas as $item)
        <div class="card">
          <h2 class="card-title">{{ $item->nama_fasilitas }}</h2>
          <p class="card-text">{{ $item->deskripsi }}</p>
        </div>
        @endforeach



      </div>

      <div class="md:w-1/2 relative flex justify-center md:justify-start overflow-visible">
        <div class="parallelogram-container overflow-visible flex flex-wrap gap-4">
          <div class="image-wrapper">
            <img src="images/room1.jpeg" alt="..." class="scroll-image" />
            <div class="curtain-overlay"></div>
          </div>
          <div class="image-wrapper">
            <img src="images/room2.jpeg" alt="..." class="scroll-image" />
            <div class="curtain-overlay"></div>
          </div>
          <div class="image-wrapper">
            <img src="images/room3.jpeg" alt="..." class="scroll-image" />
            <div class="curtain-overlay"></div>
          </div>
          <div class="image-wrapper">
            <img src="images/room4.jpeg" alt="..." class="scroll-image" />
            <div class="curtain-overlay"></div>
          </div>
        </div>
      </div>

     </div>
</div>

     <section class="bg-[#9999999] flex justify-center py-10">
      <div class="max-w-7xl w-full px-4">
        <h1 class="text-3xl font-bold text-center mb-8" style="color:#7dacd8;">Lokasi Kontrami </h1>


     <div class="map-container">
       <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1547.9983073588244!2d106.93786750501691!3d-6.41511266167306!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e6994e0ea090063%3A0x80f570dc491d0b50!2sGg.%20Bobin%2C%20Wanaherang%2C%20Kec.%20Gn.%20Putri%2C%20Kabupaten%20Bogor%2C%20Jawa%20Barat%2016965!5e0!3m2!1sid!2sid!4v1746265344360!5m2!1sid!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
     </div>
     </div>
     </section>

     <footer class="bg-[#7dacd8] text-white py-8 mt-auto">
      <div class="max-w-7xl mx-auto px-6 sm:px-12 lg:px-16 flex flex-col md:flex-row justify-between items-center gap-6">

        <div class="text-center md:text-right text-sm">
          &copy; 2025 Kontrami. All rights reserved.
        </div>
      </div>
    </footer>
















 <script>
    const fadeElements = document.querySelectorAll('.fade-in-up');

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');
        } else {
          entry.target.classList.remove('visible');
        }
      });
    }, {
      threshold: 0.2
    });

    fadeElements.forEach(element => observer.observe(element));
  </script>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    // Pilih semua elemen dengan kelas fade-in-up dan fade-in-right
    const fadeElementsUp = document.querySelectorAll('.fade-in-up');
    const fadeElementsRight = document.querySelectorAll('.fade-in-right');

    // Pilih opsi untuk IntersectionObserver
    const observerOptions = {
      threshold: 0.2 // Ketika 20% elemen masuk ke tampilan
    };

    // Fungsi untuk menangani animasi saat elemen terlihat
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          // Tambahkan kelas visible untuk memulai animasi
          entry.target.classList.add('visible');
        } else {
          // Hapus kelas visible jika elemen keluar dari tampilan
          entry.target.classList.remove('visible');
        }
      });
    }, observerOptions);

    // Observer untuk fade-in-up
    fadeElementsUp.forEach(element => {
      observer.observe(element);
    });

    // Observer untuk fade-in-right
    fadeElementsRight.forEach(element => {
      observer.observe(element);
    });
  });
</script>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const elements = document.querySelectorAll('.flip-on-scroll');

    // Tambahkan data-index otomatis kalau belum ada
    elements.forEach((el, i) => {
      el.dataset.index = i;
    });

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        const el = entry.target;
        const delay = parseInt(el.dataset.index) * 200; // 200ms tiap gambar

        if (entry.isIntersecting) {
          el.style.transitionDelay = delay + "ms";
          el.classList.add("visible");
        } else {
          el.classList.remove("visible");
          el.style.transitionDelay = "0ms";
        }
      });
    }, {
      threshold: 0.2
    });

    elements.forEach(el => observer.observe(el));
  });
  </script>

<script>
  let lastScroll = 0;
  window.addEventListener('scroll', () => {
    const overlays = document.querySelectorAll('.curtain-overlay');
    const scrollTop = window.scrollY;
    const direction = scrollTop > lastScroll ? 'down' : 'up';
    lastScroll = scrollTop;

    overlays.forEach((overlay, index) => {
      overlay.style.transition = 'transform 0.6s ease';
      if ((index % 2 === 0 && direction === 'down') || (index % 2 !== 0 && direction === 'up')) {
        // buka dari atas ke bawah
        overlay.style.transform = 'translateY(100%)';
      } else {
        // buka dari bawah ke atas
        overlay.style.transform = 'translateY(-100%)';
      }


    });
  });
</script>




  <!-- script toggle menu -->
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const menuBtn = document.getElementById("menu-btn");
      const mobileMenu = document.getElementById("mobile-menu");

      menuBtn.addEventListener("click", function () {
        mobileMenu.classList.toggle("hidden");
      });
    });
  </script>
  <script>
    function validateNoHp() {
        const nohpInput = document.getElementById('nohp');
        const value = nohpInput.value;

        // Memastikan input dimulai dengan '62'
        if (!value.startsWith('62')) {
            nohpInput.setCustomValidity('Nomor HP harus diawali dengan "62"');
        } else {
            nohpInput.setCustomValidity('');
        }
    }
</script>
<script>
    function validateImageFile(input) {
        const file = input.files[0];
        if (file && !file.type.startsWith('image/')) {
            alert('Hanya file gambar yang diperbolehkan (jpg, jpeg, png, dll)');
            input.value = ''; // Reset input file
        }
    }
</script>
</body>
</html>
