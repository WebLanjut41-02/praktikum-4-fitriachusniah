<!DOCTYPE html>
<html>

<head>
  <title>DATA MENU</title>
  <style>
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
  <center>
  <div class="wrapper">

   <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        DATA MENU
        <!--<small>advanced tables</small>-->
      </h1>

    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">

          <!-- /.box -->

          <div class="box">
            <div class="box-header">
              <!--<h3 class="box-title">Data Table With Full Features</h3>-->
              <?php
                if (isset($id)) {
                  ?>
                    <div class="alert">
                    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                    <strong>Success!</strong> Data Berhasil Ditambahakan !
                  </div>
                  <?php
                }
              ?>
               <div class="tombol">
                    <a href="<?php echo site_url('menu/inputmenu'); ?>"><button type="submit" class="btn btn-primary"> <i class="fa fa-plus-square"></i> (+) TAMBAH DATA BARU</button></a>
                    <br><br>
                    <form action="<?php echo base_url(); ?>menu" method="post">
                      <input type="text" name="keyword" placeholder="Cari ...">
                      <input type="submit" name="submit" value="Cari Data">
                    </form>
                    <br>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <center>
              <table border="1">
                <thead>
                <tr>
                  <th>No.</th>
                  <th>Id Menu</th>
                  <th>Nama Paket</th>
                  <th>Gambar Paket</th>
                  <th>Harga Paket</th>
                  <th>Kategori Paket</th>
                  <th>Jenis Paket</th>
                  <th>Aksi</th>
                </tr>
                </thead>
                <tbody>

                 <?php
                 $no = $this->uri->segment('3') + 1;
		               foreach($menu as $data){
                // $dataMenu = $this->session->all_data;
                // foreach ($dataMenu as $data) {
            ?>

            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $data->Id_Menu_Paket; ?></td>
                <td><?php echo $data->Nama_Paket; ?></td>
                <td>
                   <?php
                  if ($data->Gambar_Paket=="") {
                    ?>
                      <img src="<?php echo base_url('/gambar/'); ?>default_menu.png" width="70px" height="50px">
                    <?php
                  }else{
                    ?>
                      <img src="<?php echo base_url('/gambar/menu/').$data->Gambar_Paket ?>" width="70px" height="50px">
                    <?php
                  }
                 ?>
                </td>
                <td><?php echo $data->Harga_Paket; ?></td>
                <td><?php echo $data->Kategori_Paket; ?></td>
                <td><?php echo $data->Jenis_Paket; ?></td>
                <td>
                  <center>
                    <a href="<?php echo site_url(); ?>menu/detailmenu?Id_Menu_Paket=<?php echo $data->Id_Menu_Paket ?>" class="btn btn-sm btn-success"> <i class="fa fa-newspaper-o"></i>Detail |</a>
                    <a href="<?php echo base_url(); ?>menu/editmenu?Id_Menu_Paket=<?php echo $data->Id_Menu_Paket ?>" class="btn btn-sm btn-success"> <i class="fa fa-edit"></i> Edit |</a>
                    <a href="<?php echo base_url(); ?>menu/deletemenu?Id_Menu_Paket=<?php echo $data->Id_Menu_Paket ?>" class="btn btn-sm btn-success"> <i class="fa fa-edit"></i> Delete</a>
                  </center>
                  </td>
              </tr>
            <?php } ?>
                </tbody>
                <!--<tfoot>
                <tr>
                  <th>Rendering engine</th>
                  <th>Browser</th>
                  <th>Platform(s)</th>
                  <th>Engine version</th>
                  <th>CSS grade</th>
                </tr>
                </tfoot>-->
              </table>
              <br/>
            	<?php
            	echo $this->pagination->create_links();
            	?>
            </center>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
</center>
</body>
</html>
