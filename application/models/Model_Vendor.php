<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_Vendor extends CI_Model {


	public function getAllVendor(){

		$id_akun = 'Id_Akun';
	    $this->db->from('tb_vendor');
	    $this->db->join('tb_akun',$id_akun);
	    $this->db->where('tb_akun.Delete_at','0000-00-00 00:00:00');
	    $this->db->order_by('substr(Id_Vendor, 5) + 0');

	    $query = $this->db->get();
	    return $query->result();
	}

	public function getVendor($id){
		$id_akun = 'Id_Akun';
		$this->db->from('tb_vendor');
		 $this->db->join('tb_akun',$id_akun);
		$this->db->where('Id_Vendor',$id);

		$query = $this->db->get();
		return $query->result();
	}


	public function inputVendor($id_vendor,$nama_vendor,$kategori_vendor,$no_tlp,$no_tlp_alternatif,$email,$alamat_vendor,$deskripsi_vendor,$foto,$nama_pemilik,$no_ktp,$kuota_pemesanan,$minimal_pemesanan,$status_vendor,$id_akun){
	
 	$data = array(
        'Id_Vendor' =>  $id_vendor ,
        'Nama_Vendor'=>  $nama_vendor,
        'Kategori_Vendor' => $kategori_vendor,
        'No_Telfon_Vendor' => $no_tlp,
        'No_Telfon_Alternatif_Vendor' => $no_tlp_alternatif,
        'Email_Vendor' => $email,
        'Alamat_Vendor' => $alamat_vendor,
        'Deskripsi_Vendor' => $deskripsi_vendor,
        'Foto_Profil_Vendor' => $foto,
        'Nama_Pemilik' => $nama_pemilik,
        'No_KTP' => $no_ktp,
        'Kuota_Pemesanan' => $kuota_pemesanan,
        'Minimal_Pemesanan' => $minimal_pemesanan,
        'Status_Vendor' => $status_vendor,
        'Id_Akun' => $id_akun

	);
		$this->db->insert('tb_vendor', $data);
		
	}

	public function inputUser($username,$password){

 	$data = array(
        'Akun' =>  $username ,
        'Password'=>  $password,
        'Hak_Akses' => 'Vendor'
	);
		$this->db->insert('user', $data);
	}


	public function editVendor($id_vendor,$nama_vendor,$kategori_vendor,$no_tlp,$no_tlp_alternatif,$email,$alamat_vendor,$deskripsi_vendor,$foto,$nama_pemilik,$no_ktp,$kuota_pemesanan,$minimal_pemesanan,$status_vendor)
    {
	
      $data = array(
        'Id_Vendor' =>  $id_vendor ,
        'Nama_Vendor'=>  $nama_vendor,
        'Kategori_Vendor' => $kategori_vendor,
        'No_Telfon_Vendor' => $no_tlp,
        'No_Telfon_Alternatif_Vendor' => $no_tlp_alternatif,
        'Email_Vendor' => $email,
        'Alamat_Vendor' => $alamat_vendor,
        'Deskripsi_Vendor' => $deskripsi_vendor,
        'Foto_Profil_Vendor' => $foto,
        'Nama_Pemilik' => $nama_pemilik,
        'No_KTP' => $no_ktp,
        'Kuota_Pemesanan' => $kuota_pemesanan,
        'Minimal_Pemesanan' => $minimal_pemesanan,
        'Status_Vendor' => $status_vendor

	);
        	$this->db->where('Id_Vendor', $id_vendor);
			$this->db->update('tb_vendor', $data);
			//print_r($data);
	}

	 public function getJumlahVendor()
        {

            $query = $this->db->query("SELECT COUNT('Id_Vendor') as Jumlah FROM tb_vendor");
            return $query;
        }
}



	?>
