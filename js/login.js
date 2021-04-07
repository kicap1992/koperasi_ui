let level = localStorage.getItem("level") ?? null;
let nik = localStorage.getItem("nik") ?? null;

// console.log(level)
// console.log(nik)

if (level != null && nik != null) {
  let res = JSON.parse($.ajax({
    url: url+'api/login',
    type: 'get',
    data: {where:{nik : nik,level : level}},
    async : false,
  }).responseText);

  console.log(res)
  switch (res.res) {
    case 'ok':
      window.location.href = res.url
      break;
    case 'ko':
      localStorage.removeItem("level");
      localStorage.removeItem("nik");
      break;
  }
}

function login () {
  // console.log(url)
  const username = $("#username").val()
  const password = $("#password").val()

  // console.log(username)
  // console.log(password)

  if (username == '') {
    toastnya('username', 'Username Harus Terisi')
  }else if (password == '') {
    toastnya('password', 'Password Harus Terisi')
  }else{
    // console.log('jalankan')
    $.ajax({
      url: url+'api/login',
      type: 'get',
      data: {where : {username : username , password : password}},
      
      beforeSend: function(res) {
                           
        $.blockUI({ 
          message: "Sedang Diproses", 
          css: { 
          border: 'none', 
          padding: '15px', 
          backgroundColor: '#000', 
          '-webkit-border-radius': '10px', 
          '-moz-border-radius': '10px', 
          opacity: .5, 
          color: '#fff' 
        } });
      },
      success:  function  (response) {
        $.unblockUI();
        // console.log(response)
        localStorage.setItem("level", response.level);
        localStorage.setItem('nik', response.nik)
        swal({
          title : "Success",
          text:  "Selamat Datang",
          icon: "success",
          buttons: {
            cancel: false,
            confirm: false,
          },
          timer : 1500
          // dangerMode: true,
        })
        .then((hehe) =>{
          // console.log(localStorage.getItem("level"));
          // console.log(localStorage.getItem("nik"));
          location.reload();
        });
        
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) { 
        console.log(errorThrown)
        $.unblockUI();
        switch (errorThrown) {
          case "Bad Request":
            toastnya('username',"Username dan Password Salah",)
            break;
          case "Internal Server Error":
            toastnya(null,errorThrown)
            break;
          default:
            swal({
              text: "Koneksi Gagal, Sila Pastikan Perangkat Terhubung Jaringan Internet",
              icon: "warning",
              buttons: {
                  cancel: false,
                  confirm: true,
                },
              // dangerMode: true,
            })
            .then((hehe) =>{
              location.reload();
            });
            break;
        }
       
      } 
    });

  }
 
}


function toastnya(id,mesej){
      
  toastr.options = {
    "closeButton": true,
    "debug": false,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  };

  toastr.error("<center>"+mesej+"</center>");

  if (id != null) {
    $("#"+id).focus();
  }

}

// localStorage.removeItem('level')
// localStorage.removeItem('nik')