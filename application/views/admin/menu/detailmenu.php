<!DOCTYPE html>
<html>

<head>
  <title>DATA MENU</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

   <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        DETAIL DATA MENU
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
              <div class="tombol">
                    <a href="<?php echo site_url('menu'); ?>"><button type="submit" class="btn btn-primary">  <i class="fa fa-arrow-left"></i> Back</button></a>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

          <b>Foto Menu</b><br>
          <?php
                  if ($data[0]->Gambar_Paket=="") {
                    ?>
                      <img src="<?php echo base_url('/gambar/'); ?>default_menu.png" width="100px" height="100px">
                    <?php
                  }else{
                    ?>
                    <?php if(isset($data[0]->Gambar_Paket))?><img src="<?php echo base_url('/gambar/menu/').$data[0]->Gambar_Paket; ?>" width="500px" height="300px"> <?php; else echo "Masih Kosong"; ?>
                    <?php
                  }
                 ?>


        <br>
          <table class="table table-stripe">
    <thead>
      <tr>
        <th>Id Menu Paket</th>
        <th>:</th>
        <td><?php if(isset($data[0]->Id_Menu_Paket))echo $data[0]->Id_Menu_Paket; else echo "Masih Kosong"; ?></td>
      </tr>

      <tr>
        <th>Nama Paket</th>
        <th>:</th>
        <td><?php if(isset($data[0]->Nama_Paket))echo $data[0]->Nama_Paket; else echo "Masih Kosong"; ?></td>
      </tr>

      <tr>
        <th>Harga Paket</th>
        <th>:</th>
        <td><?php if(isset($data[0]->Harga_Paket))echo $data[0]->Harga_Paket; else echo "Masih Kosong"; ?></td>
      </tr>

      <tr>
        <th>Deskripsi Paket</th>
        <th>:</th>
        <td><?php if(isset($data[0]->Deskripsi_Paket))echo $data[0]->Deskripsi_Paket; else echo "Masih Kosong"; ?></td>
      </tr>

      <tr>
        <th>Kategori Paket</th>
        <th>:</th>
        <td><?php if(isset($data[0]->Kategori_Paket))echo $data[0]->Kategori_Paket; else echo "Masih Kosong"; ?></td>
      </tr>

     <tr>
        <th>Jenis Paket</th>
        <th>:</th>
        <td><?php if(isset($data[0]->Jenis_Paket))echo $data[0]->Jenis_Paket; else echo "Masih Kosong"; ?></td>
      </tr>

       <tr>
        <th>Kategori Menu Paket</th>
        <th>:</th>
        <td><?php if(isset($data[0]->Kategori_Menu_Paket))echo $data[0]->Kategori_Menu_Paket; else echo "Masih Kosong"; ?></td>
      </tr>

       <tr>
        <th>Id Vendor</th>
        <th>:</th>
        <td><?php if(isset($data[0]->Id_Vendor))echo $data[0]->Id_Vendor; else echo "Masih Kosong"; ?></td>
      </tr>

    </thead>
  </table>
 <br><a href="<?php echo base_url(); ?>menu/editmenu?Id_Menu_Paket=<?php echo $data[0]->Id_Menu_Paket ?>" class="btn btn-sm btn-success">Edit</a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>


</body>
</html>
