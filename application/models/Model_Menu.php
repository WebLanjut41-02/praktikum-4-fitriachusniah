<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_Menu extends CI_Model {


	public function getAllMenu(){

	    $this->db->from('tb_menu_paket');
		$this->db->order_by('substr(Id_Menu_Paket, 5) + 0');

	    $query = $this->db->get();
	    return $query->result();
	}

	function data($number,$offset){
	return $query = $this->db->get('tb_menu_paket',$number,$offset)->result();
}

function jumlah_data(){
	return $this->db->get('tb_menu_paket')->num_rows();
}

	public function getMenu($id){
		$this->db->from('tb_menu_paket');
		$this->db->where('Id_Menu_Paket',$id);

		$query = $this->db->get();
		return $query->result();
	}


	public function inputmenu($id_paket,$nama_paket,$gambar_paket,$harga_paket,$deskripsi_paket,$kategori_paket,$jenis_paket,$kategori_menu_paket,$id_vendor){

 	$data = array(
        'Id_Menu_Paket' =>  $id_paket,
        'Nama_Paket' => $nama_paket,
        'Gambar_Paket'=>  $gambar_paket,
        'Harga_Paket' => $harga_paket,
        'Deskripsi_Paket' => $deskripsi_paket,
		'Kategori_Paket' => $kategori_paket,
        'Jenis_Paket' => $jenis_paket,
        'Kategori_Menu_Paket' => $kategori_menu_paket,
        'Id_Vendor' => $id_vendor
	);

		$this->db->insert('tb_menu_paket', $data);

	}

	public function editmenu($id_paket,$nama_paket,$gambar_paket,$harga_paket,$deskripsi_paket,$kategori_paket,$jenis_paket,$kategori_menu_paket,$id_vendor)
    {


 	$data = array(
        'Id_Menu_Paket' =>  $id_paket,
        'Nama_Paket' => $nama_paket,
        'Gambar_Paket'=>  $gambar_paket,
        'Harga_Paket' => $harga_paket,
        'Deskripsi_Paket' => $deskripsi_paket,
		'Kategori_Paket' => $kategori_paket,
        'Jenis_Paket' => $jenis_paket,
        'Kategori_Menu_Paket' => $kategori_menu_paket,
        'Id_Vendor' => $id_vendor
	);

	$this->db->where('Id_Menu_Paket', $id_paket);
	$this->db->update('tb_menu_paket', $data);

}
	 public function getJumlahMenu()
        {

            $query = $this->db->query("SELECT COUNT('Id_Menu_Paket') as Jumlah FROM tb_menu_paket");
            return $query;
        }


				public function deleteMenu($id)
		         {

		             $query = $this->db->query("DELETE FROM tb_menu_paket WHERE Id_Menu_Paket = '$id'");
		             return $query;
		         }

						 public function cariMenu($cari)
							{
								$data = $this->db->query("SELECT * from tb_menu_paket
																					where Id_Menu_Paket like '%$cari%'
																					OR Nama_Paket like '%$cari%'
																					OR Harga_Paket like '%$cari%'
																					OR Kategori_Paket like '%$cari%'
																					OR Jenis_Paket like '%$cari%' ");
								return $data->result();
							}



}
	?>
