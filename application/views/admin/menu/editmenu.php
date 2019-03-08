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
        INPUT DATA MENU
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
              <table>
                <form role="form" action="<?php echo base_url(); ?>menu/proseseditmenu" method="post" enctype="multipart/form-data">

                    <tr>
                      <div class="form-group">

                        <td><label for="Id_Menu">Id Menu</label></td>
                        <td>:</td>
                        <td>  <input type="text" class="form-control" id="Id_Menu_Paket" name="Id_Menu_Paket" value="<?php echo $data[0]->Id_Menu_Paket ?>" readonly></td>
                      </div>
                    </tr>

                    <tr>
                      <div class="form-group">
                        <td><label>Nama Paket</label></td>
                        <td>:</td>
                        <td>  <input type="text" class="form-control" id="Nama_Paket" name="Nama_Paket" value="<?php echo $data[0]->Nama_Paket ?>" required></td>
                      </div>
                    <tr>

                    <tr>
                      <?php echo form_open_multipart('upload/do_upload');?>

                      <div class="form-group">
                        <td><label>Gambar Paket</label></td>
                        <td>:</td>
                        <td>  <input type="file" class="form-control" id="Gambar_Paket" name="Gambar_Paket" >
                           Foto Profil Lama : <img src="<?php echo base_url('/gambar/menu/').$data[0]->Gambar_Paket; ?>" width="70px" height="50px"></td>
                      </div>
                    </tr>

                    <input type="hidden" name="Foto_Profil_Lama" value="<?php echo $data[0]->Gambar_Paket ?>">

                    <tr>
                      <div class="form-group">
                        <td><label>Harga Paket</label><td>

                        <td><input type="text" class="form-control" id="Harga_Paket" name="Harga_Paket" value="<?php echo $data[0]->Harga_Paket ?>" required></td>
                      </div>
                    </tr>

                    <tr>
                      <div class="form-group">
                          <td><label>Deskripsi Paket</label></td>
                          <td>:</td>
                          <td><textarea class="form-control" rows="3" name="Deskripsi_Paket" required=""><?php echo $data[0]->Deskripsi_Paket ?></textarea></td>
                        </div>
                    </tr>

                    <tr>
                      <div class="form-group">
                          <td><label>Kategori Paket</label></td>
                          <td>:</td>
                          <td>  <select name="Kategori_Paket" class="form-control select2" style="width: 100%;" required="">
                              <option selected="selected">==PILIH===</option>
                              <option value="event"  <?php if($data[0]->Kategori_Paket=="event") echo "selected" ?>>Event</option>
                              <option value="harian"  <?php if($data[0]->Kategori_Paket=="harian") echo "selected" ?>>Harian</option>
                            </select></td>
                        </div>
                    </tr>


                    <tr>
                      <div class="form-group">
                        <td><label>Jenis Paket</label></td>
                        <td>:</td>
                        <td><select name="Jenis_Paket" class="form-control select2" style="width: 100%;" required="">
                          <option selected="selected">==PILIH===</option>
                          <option value="nasi"  <?php if($data[0]->Jenis_Paket=="nasi") echo "selected" ?>>Nasi</option>
                          <option value="kue"  <?php if($data[0]->Jenis_Paket=="kue") echo "selected" ?>>Kue</option>
                        </select></td>
                      </div>

                    </tr>

                    <tr>
                      <div class="form-group">
                       <td><label>Kategori Menu Paket</label></td>
                       <td>:</td>
                       <td>  <select name="Kategori_Menu_Paket" class="form-control select2" style="width: 100%;" required="">
                           <option selected="selected">==PILIH===</option>
                           <option value="ayam dan bebek" <?php if($data[0]->Kategori_Menu_Paket=="ayam dan bebek") echo "selected" ?>>Ayam dan Bebek<option>
                           <option value="aneka nasi" <?php if($data[0]->Kategori_Menu_Paket=="aneka nasi") echo "selected" ?>>Aneka Nasi</option>
                           <option value="bakso, soto dan soup" <?php if($data[0]->Kategori_Menu_Paket=="bakso, soto dan soup") echo "selected" ?>>Bakso, Soto dan Soup</option>
                           <option value="mie" <?php if($data[0]->Kategori_Menu_Paket=="mie") echo "selected" ?>>Kue</option>
                           <option value="snack dan roti" <?php if($data[0]->Kategori_Menu_Paket=="snack dan roti") echo "selected" ?>>Snack dan Roti</option>
                         </select></td>
                     </div>

                    </tr>

                    <tr>
                       <div class="form-group">
                      <td><label>Id Vendor</label></td>
                      <td>:</td>
                      <td><input type="text" class="form-control" id="Id_Vendor" name="Id_Vendor" value="<?php echo $data[0]->Id_Vendor ?>" readonly="readonly"></td>
                    </div>

                    </tr>

                    <tr>
                      <td colspan="3"> <div class="tombol">
                            <button type="submit" class="btn btn-primary">INPUT DATA</button>
                        </div></td>
                    </tr>


                <!-- /.box-body -->


              </form>
              </table>

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
