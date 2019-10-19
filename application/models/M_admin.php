<?php

class M_admin extends CI_Model
{

  public function insert($tabel,$data)
  {
    $this->db->insert($tabel,$data);
  }

  public function select($tabel)
  {
    $query = $this->db->get($tabel);
    return $query->result();
  }

  public function cek_jumlah($tabel,$id_transaksi)
  {
    return  $this->db->select('*')
               ->from($tabel)
               ->where('id_transaksi',$id_transaksi)
               ->get();

  }

  public function get_data_array($tabel,$id_transaksi)
  {
    $query = $this->db->select()
                      ->from($tabel)
                      ->where($id_transaksi)
                      ->get();
    return $query->result_array();
  }

  public function get_data($tabel,$id_transaksi)
  {
    $query = $this->db->select()
                      ->from($tabel)
                      ->where($id_transaksi)
                      ->get();
    return $query->result();
  }

  public function update($tabel,$data,$where)
  {
    $this->db->where($where);
    $this->db->update($tabel,$data);
  }

  public function delete($tabel,$where)
  {
    $this->db->where($where);
    $this->db->delete($tabel);
  }

  public function mengurangi($tabel,$id_transaksi,$jumlah)
  {
    $this->db->set("jumlah","jumlah - $jumlah");
    $this->db->where('id_transaksi',$id_transaksi);
    $this->db->update($tabel);
  }

  public function update_password($tabel,$where,$data)
  {
    $this->db->where($where);
    $this->db->update($tabel,$data);
  }

  public function get_data_gambar($tabel,$username)
  {
    $query = $this->db->select()
                      ->from($tabel)
                      ->where('username_user',$username)
                      ->get();
    return $query->result();
  }

  public function sum($tabel,$field)
  {
    $query = $this->db->select_sum($field)
                      ->from($tabel)
                      ->get();
    return $query->result();
  }

  public function numrows($tabel)
  {
    $query = $this->db->select()
                      ->from($tabel)
                      ->get();
    return $query->num_rows();
  }

  public function kecuali($tabel,$username)
  {
    $query = $this->db->select()
                      ->from($tabel)
                      ->where_not_in('username',$username)
                      ->get();

    return $query->result();
  }
  
  public function getData($type, $id="") {
    if ($type === 'po') {
      $sql = "select * from master_barang
              inner join status_barang on status_barang.id = master_barang.id_status_barang";
    } elseif ($type === 'stok_limit') {
      $sql = "select count(*) as stok_limit from master_barang
              inner join status_barang on status_barang.id = master_barang.id_status_barang
              where id_status_barang = 1
              and sisa_stok <= stok_minimum
              ";
    } elseif ($type === 'getStokLimit') {
      $sql = "select * from master_barang
              inner join status_barang on status_barang.id = master_barang.id_status_barang
              where id_status_barang = 1
              and sisa_stok <= stok_minimum
              ";
    } elseif ($type === 'getBarang') {
      $condition = !empty($id) ? " and kode_barang='$id'" : '';
      $sql = "select * from master_barang where id_status_barang=1".$condition;
    }

    $query = $this->db->query($sql);
    return $query->result();
  }

  public function execute($action, $type, $data) {
    if ($action == 'insert') {
      if ($type == 'insertPO') {
        $this->db->insert('master_barang', $data);
      }elseif ($type == 'BarangKeluar') {
        $sisa_stok = $data['cekStok'][0]->sisa_stok - $data['jumlah'];
        $paramBarang = array(
          'kode_barang' => $data['cekStok'][0]->kode_barang,
          'sisa_stok' => $sisa_stok
        );

        $dataBarangKeluar = array(
          'id_transaksi' => $data['id_transaksi'],
          'tanggal_keluar' => $data['tanggal_keluar'],
          'kode_barang' => $data['kode_barang'],
          'jumlah' => $data['jumlah'],
          'keterangan' => $data['keterangan'],
        );

        $this->execute('update','masterBarang', $paramBarang);
        $this->db->insert('tb_barang_keluar', $dataBarangKeluar);
      }elseif ($type == 'BarangMasuk') {
        echo "<pre>";
        print_r($data);die;
      }
    } elseif($action == 'update') {
      if ($type == 'masterBarang') {
        $this->db->where('kode_barang', $data['kode_barang']);
        $this->db->update('master_barang', array('sisa_stok' => $data['sisa_stok']));

      }
    }
  }

}



 ?>
