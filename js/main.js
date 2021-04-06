let level = localStorage.getItem("level");
let nik = localStorage.getItem("nik");
let nama;

if (level != '' || level != null) {
  let res = JSON.parse($.ajax({
    url: url,
    type: 'post',
    data: {nik : nik,level : level,proses : 'cek_data_detail'},
    async : false,
  }).responseText);

  console.log(res)
  switch (res.res) {
    case 'ok':
      // window.location.href = res.url
      nama = res.nama
      break;
    case 'ko':
      localStorage.removeItem("level");
      localStorage.removeItem("nik");
      window.location.href = '../'
      break;
  }
}


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