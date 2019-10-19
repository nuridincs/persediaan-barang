  <?php $this->load->view('layout/head'); ?>
  <?php $this->load->view('layout/header'); ?>
  <!-- Left side column. contains the logo and sidebar -->
  <?php $this->load->view('layout/sidebar'); ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Input Data Barang Keluar
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Data Barang Keluar</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <div class="container">
            <!-- general form elements -->
          <div class="box box-primary" style="width:94%;">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-archive" aria-hidden="true"></i> Tambah Data Barang Keluar</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <div class="container">
            <form action="<?=base_url('admin/process/insertBarangKeluar')?>" role="form" method="post">

              <?php if($this->session->flashdata('msg_error')){ ?>
                <div class="alert alert-warning alert-dismissible" style="width:91%">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Warning!</strong><br> <?php echo $this->session->flashdata('msg_error');?>
               </div>
              <?php } ?>

              <div class="box-body">
                <div class="form-group">
                  <label for="id_transaksi" style="margin-left:220px;display:inline;">ID Transaksi</label>
                  <input type="text" name="id_transaksi" style="margin-left:37px;width:20%;display:inline;" class="form-control" readonly="readonly" value="BK-<?=date("Y");?><?=random_string('numeric', 8);?>">
                </div>
                <div class="form-group">
                  <label for="tanggal" style="margin-left:220px;display:inline;">Tanggal</label>
                  <input type="text" name="tanggal_keluar" style="margin-left:66px;width:20%;display:inline;" class="form-control form_datetime" required placeholder="Klik Disini">
                </div>
                <br><br>
                <div class="row">
                  <div class="col-sm-3">
                    <div class="form-group">
                      <label for="nama_Barang" style="width:73%;">Nama Barang</label>
                      <select class="form-control" name="kode_barang" required>
                        <option value="" selected="">-- Pilih --</option>
                        <?php foreach($dataBarang as $s){ ?>
                        <option value="<?=$s->kode_barang?>"><?=$s->kode_barang." ".$s->nama_barang?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="form-group">
                      <label for="satuan" style="width:73%;">Keterangan</label>
                      <input type="text" name="keterangan" style="width:90%;margin-right: 67px;" class="form-control" id="keterangan" placeholder="Keterangan">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="form-group">
                      <label for="jumlah">Jumlah</label>
                      <input type="number" name="jumlah" required class="form-control" id="jumlah">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="form-group" style="margin-top: 25px;">
                      <button type="reset" class="btn btn-basic" name="btn_reset"><i class="fa fa-eraser" aria-hidden="true"></i> Reset</button>
                    </div>
                  </div>
                </div>
                
              <!-- /.box-body -->
              <div class="box-footer" style="width:93%;">
                <a type="button" class="btn btn-default" style="width:10%;margin-right:26%" onclick="history.back(-1)" name="btn_kembali"><i class="fa fa-arrow-left" aria-hidden="true"></i> Kembali</a>
                <a type="button" class="btn btn-info" style="width:14%;margin-right:29%" href="<?=base_url('admin/tabel_barangkeluar')?>" name="btn_listbarang"><i class="fa fa-table" aria-hidden="true"></i> Lihat List Barang</a>
                <button type="submit" style="width:20%" class="btn btn-success"><i class="fa fa-check" aria-hidden="true"></i> Submit</button>
              </div>
            </form>
          </div>
          </div>
        </div>

        </div>
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; <?=date('Y')?></strong>
  </footer>

  <div class="control-sidebar-bg"></div>
  </div>
  <!-- ./wrapper -->

  <!-- jQuery 3 -->
  <script src="<?php echo base_url()?>assets/web_admin/bower_components/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap 3.3.7 -->
  <script src="<?php echo base_url()?>assets/web_admin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- FastClick -->
  <script src="<?php echo base_url()?>assets/web_admin/bower_components/fastclick/lib/fastclick.js"></script>
  <!-- AdminLTE App -->
  <script src="<?php echo base_url()?>assets/web_admin/dist/js/adminlte.min.js"></script>
  <script src="<?php echo base_url()?>assets/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="<?php echo base_url()?>assets/web_admin/dist/js/demo.js"></script>

  <script type="text/javascript">
      $(".form_datetime").datetimepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayBtn: true,
        pickTime: false,
        minView: 2,
        maxView: 4,
      });
  </script>
  </body>
  </html>
