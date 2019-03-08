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
                <form role="form" action="<?php echo base_url(); ?>menu/prosesinputmenu" method="post" enctype="multipart/form-data">

                    <tr>
                      <div class="form-group">
                        <?php
                           $i = 1;
                          $v = "MEN-";
                          $last_id = 0;
                           $dataMenu = $this->session->all_data;
                           foreach ($dataMenu as $data) {
                             $last_id = substr($data->Id_Menu_Paket, 4,3);
                           }

                          $arr = array($v,$last_id+1);
                          $newest_id = implode("", $arr);

                        ?>
                        <td><label for="Id_Vendor">Id Menu</label></td>
                        <td>:</td>
                        <td><input type="text" id="Id_Menu_Paket" name="Id_Menu_Paket" value="<?php echo $newest_id; ?>" readonly></td>
                      </div>
                    </tr>

                    <tr>
                      <div class="form-group">
                        <td><label>Nama Paket</label></td>
                        <td>:</td>
                        <td><input type="text" class="form-control" id="Nama_Paket" name="Nama_Paket" placeholder="Nama Paket" required></td>
                      </div>
                    <tr>

                    <tr>
                      <?php echo form_open_multipart('upload/do_upload');?>

                      <div class="form-group">
                        <td><label>Gambar Paket</label></td>
                        <td>:</td>
                        <td><input type="file" class="form-control" id="Gambar_Paket" name="Gambar_Paket" ></td>
                      </div>
                    </tr>

                    <tr>
                      <div class="form-group">
                        <td><label>Harga Paket</label><td>

                        <td><input type="text" class="form-control" id="Harga_Paket" name="Harga_Paket" placeholder="Harga Paket" required></td>
                      </div>
                    </tr>

                    <tr>
                      <div class="form-group">
                          <td><label>Deskripsi Paket</label></td>
                          <td>:</td>
                          <td><textarea class="form-control" rows="3" name="Deskripsi_Paket" placeholder="Deskripsi Paket" required=""></textarea></td>
                        </div>
                    </tr>

                    <tr>
                      <div class="form-group">
                          <td><label>Kategori Paket</label></td>
                          <td>:</td>
                          <td><select name="Kategori_Paket" class="form-control select2" style="width: 100%;" required="">
                            <option selected="selected">==PILIH===</option>
                            <option value="event">Event</option>
                            <option value="harian">Harian</option>
                          </select></td>
                        </div>
                    </tr>


                    <tr>
                      <div class="form-group">
                        <td><label>Jenis Paket</label></td>
                        <td>:</td>
                        <td><select name="Jenis_Paket" class="form-control select2" style="width: 100%;" required="">
                          <option selected="selected">==PILIH===</option>
                          <option value="nasi">Nasi</option>
                          <option value="kue">Kue</option>
                        </select></td>
                      </div>

                    </tr>

                    <tr>
                      <div class="form-group">
                       <td><label>Kategori Menu Paket</label></td>
                       <td>:</td>
                       <td><select name="Kategori_Menu_Paket" class="form-control select2" style="width: 100%;" required="">
                         <option selected="selected">==PILIH===</option>
                         <option value="ayam dan bebek">Ayam dan Bebek<option>
                         <option value="aneka nasi">Aneka Nasi</option>
                         <option value="bakso, soto dan soup">Bakso, Soto dan Soup</option>
                         <option value="mie">Kue</option>
                         <option value="snack dan roti">Snack dan Roti</option>
                       </select></td>
                     </div>

                    </tr>

                    <tr>
                       <div class="form-group">
                      <td><label>Id Vendor</label></td>
                      <td>:</td>
                      <td><select name="Id_Vendor" class="form-control">
                        <option value="">==PILIH==</option>
                        <?php

                              $dataVendor = $this->session->all_data2;
                              //print_r($dataSiswa);

                              foreach ($dataVendor as $data) { //ngabsen data
                                echo "<option value='". $data->Id_Vendor."'>".$data->Id_Vendor." - ". $data->Nama_Vendor."</option>";
                              }
                          ?>

                        ?>
                      </select></td>
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
