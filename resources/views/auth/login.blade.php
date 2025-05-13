
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login Penghuni</title>
  <style>
    html, body {
      width: 100%;
      height: 100%;
      display: flex;
      background: linear-gradient(45deg, #83a4d4, #7dacd8);
      font-family: sans-serif;
    }
    *, *::before, *::after {
      box-sizing: border-box;
    }
    #form {
      margin: auto;
      width: 400px;
      padding: 20px 30px;
      background: #fff;
      border: 1px solid #dfdfdf;
      transform-style: preserve-3d;
      perspective-origin: 50px center;
      perspective: 2000px;
      transition: transform 1s ease;
      position: relative;
    }
    #form::before, #form::after {
      content: '';
      position: absolute;
      width: 100%;
      left: 0;
    }
    #form::before {
      height: 100%;
      top: 0;
      transform: translateZ(-100px);
      background: #333;
      opacity: 0.3;
    }
    #form::after {
      content: 'SUCCESS!';
      transform: translateY(-50%) translateZ(-101px) scaleX(-1);
      top: 50%;
      color: #fff;
      text-align: center;
      font-weight: bold;
    }
    .field {
      position: relative;
      background: #cfcfcf;
      transform-style: preserve-3d;
      margin-top: 10px;
    }
    .icon {
      width: 24px;
      height: 24px;
      position: absolute;
      top: calc(50% - 12px);
      left: 12px;
      transform: translateZ(50px);
    }
    .icon::before, .icon::after {
      content: '';
      display: block;
      width: 100%;
      height: 100%;
      position: absolute;
      top: 0;
      left: 0;
    }
    .input {
      border: 1px solid #dfdfdf;
      background: #fff;
      height: 48px;
      line-height: 48px;
      padding: 0 10px 0 48px;
      width: 100%;
      transform: translateZ(26px);
    }
    .button {
      display: block;
      width: 100%;
      border: 0;
      text-align: center;
      font-weight: bold;
      color: #fff;
      background: linear-gradient(45deg,rgb(216, 202, 187), rgb(216, 202, 187));
      margin-top: 20px;
      padding: 14px;
      position: relative;
      transform-style: preserve-3d;
      transform: translateZ(26px);
      transition: transform 0.3s ease;
      cursor: pointer;
    }
    .button:hover {
      transform: translateZ(13px);
    }
    .side-top-bottom::before, .side-top-bottom::after {
      content: '';
      width: 100%;
      height: 26px;
      background: linear-gradient(45deg,rgb(216, 202, 187), rgb(216, 202, 187));
      position: absolute;
      left: 0;
    }
    .side-top-bottom::before {
      transform-origin: center top;
      transform: translateZ(-26px) rotateX(90deg);
      top: 0;
    }
    .side-top-bottom::after {
      transform-origin: center bottom;
      transform: translateZ(-26px) rotateX(-90deg);
      bottom: 0;
    }
    .side-left-right::before, .side-left-right::after {
      content: '';
      height: 100%;
      width: 26px;
      position: absolute;
      top: 0;
    }
    .side-left-right::before {
      background:rgb(216, 202, 187);
      transform-origin: left center;
      transform: rotateY(90deg);
      left: 0;
    }
    .side-left-right::after {
      background:rgb(216, 202, 187);
      transform-origin: right center;
      transform: rotateY(-90deg);
      right: 0;
    }
    .email .icon::before, .email .icon::after {
      background: url('https://cdn-icons-png.flaticon.com/512/561/561127.png') center/contain no-repeat;
    }
    .password .icon::before, .password .icon::after {
      background: url('https://cdn-icons-png.flaticon.com/512/3064/3064155.png') center/contain no-repeat;
    }

    .face-up-left { transform: rotateY(-30deg) rotateX(30deg); }
    .face-up-right { transform: rotateY(30deg) rotateX(30deg); }
    .face-down-left { transform: rotateY(-30deg) rotateX(-30deg); }
    .face-down-right { transform: rotateY(30deg) rotateX(-30deg); }
    .form-complete { animation: formComplete 2s ease; }
    .form-error { animation: formError 2s ease; }

    input, button:active, input:focus {
      outline: none;
      border: 1px solid #f58c8c;
    }

    @keyframes formComplete {
      50%, 55% { transform: rotateX(30deg) rotateY(180deg); }
      100% { transform: rotateX(0deg) rotateY(1turn); }
    }
    @keyframes formError {
      0%, 100% { transform: rotateX(0deg) rotateY(0deg); }
      25% { transform: rotateX(-25deg); }
      33% { transform: rotateX(-25deg) rotateY(45deg); }
      66% { transform: rotateX(-25deg) rotateY(-30deg); }
    }

    small {
      color: #999;
      text-align: center;
      display: block;
      margin-top: 20px;
      backface-visibility: hidden;
    }
  </style>
</head>
<body>
  <form id="form" method="POST" action="{{ route('login') }}">
    @csrf

    @if(session('error'))
      <div class="alert alert-danger">{{ session('error') }}</div>
    @endif

    <div class="field email">
      <div class="icon"></div>
      <input type="text" name="nohp" id="email" class="input @error('nohp') is-invalid @enderror" placeholder="Nomor HP" value="{{ old('nohp') }}" required>
      @error('nohp')
        <small>{{ $message }}</small>
      @enderror
    </div>

    <div class="field password">
      <div class="icon"></div>
      <input type="password" name="password" id="password" class="input @error('password') is-invalid @enderror" placeholder="Kata Sandi" required>
      @error('password')
        <small>{{ $message }}</small>
      @enderror
    </div>

    <button type="submit" id="submit" class="button">
      LOGIN
      <div class="side-top-bottom"></div>
      <div class="side-left-right"></div>
    </button>

    <small>&copy; {{ date('Y') }} Kontrami</small>
  </form>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    var formAnim = {
      $form: $('#form'),
      animClasses: ['face-up-left', 'face-up-right', 'face-down-left', 'face-down-right', 'form-complete', 'form-error'],
      resetClasses: function () {
        var $form = this.$form;
        $.each(this.animClasses, function (k, c) {
          $form.removeClass(c);
        });
      },
      faceDirection: function (d) {
        this.resetClasses();
        d = parseInt(d) < this.animClasses.length ? d : -1;
        if (d >= 0) {
          this.$form.addClass(this.animClasses[d]);
        }
      }
    };

    var $input = $('#email, #password'),
        $submit = $('#submit'),
        focused = false,
        completed = false;

    $input.focus(function () {
      focused = true;
      if (completed) {
        formAnim.faceDirection(1);
      } else {
        formAnim.faceDirection(0);
      }
    });

    $input.blur(function () {
      formAnim.resetClasses();
    });

    $input.on('input paste keyup', function () {
      completed = true;
      $input.each(function () {
        if (this.value === '') {
          completed = false;
        }
      });
      formAnim.faceDirection(completed ? 1 : 0);
    });

    $submit.click(function (e) {
      if (!completed) {
        e.preventDefault();
        formAnim.faceDirection(5);
        setTimeout(function () {
          formAnim.resetClasses();
        }, 2000);
      }
    });

    $(function () {
      setTimeout(function () {
        if (!focused) {
          $input.eq(0).focus();
        }
      }, 2000);
    });
  </script>
</body>
</html>
