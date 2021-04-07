let level = localStorage.getItem("level") ?? null;
let nik = localStorage.getItem("nik") ?? null;
var nama;

// console.log(level)
// console.log(nik)
// console.log(nama)

if (level != '' || level != null) {
  let res = JSON.parse( $.ajax({
    url: url+'api/admin',
    type: 'get',
    data: {where : {nik_admin : nik}},
    async : false,
  }).responseText);

  // console.log(level)
  // console.log(nik)
  // console.log(res)

  if(res.res == 'ok'){
    // case 'ok':
      // window.location.href = res.url
      nama = 'Admin';
      // console.log(nama)
      // nama = res.nama
      // break;
  }else{
      localStorage.removeItem("level");
      localStorage.removeItem("nik");
      window.location.href = '../'
      // break;
  }
}else{
  localStorage.removeItem("level");
  localStorage.removeItem("nik");
  window.location.href = '../'
}

// console.log(nama)
$(".name").html('<a href="#">'+nama+'</a>')
$(".position").html(level)

function logout(){
  swal({
    title: "Yakin ingin Logout?",
    text: "Anda akan keluar dari sistem",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  })
  .then((logout) => {
    if (logout) {
      localStorage.removeItem("nik");
      localStorage.removeItem("level");
      window.location.href ='../index.html';
    } else {
      swal("Terima kasih kerana masih di sistem");
    }
  });
}

function toastnya(mesej){
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
  // $("#"+id).focus();
}

function isNumberKey(evt){
  var charCode = (evt.which) ? evt.which : evt.keyCode
  if (charCode > 31 && (charCode < 48 || charCode > 57 ))
      return false;
  return true;
  // console.log(evt.key)
}

function myFunction(a) {
  var x = $("#"+a);
  var xx = document.getElementById(a);

  
  if (xx.style.display === "none") {
    x.slideToggle();
  } else {
    x.slideToggle();
  }
}

function objectifyForm(formArray) {
  //serialize data function
  var returnArray = {};
  for (var i = 0; i < formArray.length; i++){
    returnArray[formArray[i]['name']] = formArray[i]['value'];
  }
  return returnArray;
}

function addZero(i) {
  if (i < 10) {
    i = "0" + i;
  }
  return i;
}

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}