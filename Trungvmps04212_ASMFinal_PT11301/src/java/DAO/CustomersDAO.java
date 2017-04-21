/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Customes;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;


/**
 *
 * @author Do Tien Dung
 */
public class CustomersDAO {
        public static List<Customes> layDanhSachKH(String tenkh) {
        List<Customes> list = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        String sql = "from Customes";
        if (tenkh.length() > 0) {
            sql += " where Hoten like '%"+tenkh+"%'";
        }
        Query query = session.createQuery(sql);
        list = query.list();
        System.out.println("Thanh Cong");
        return list;
    }

    public CustomersDAO() {
    }

    

    public static Customes layThongTinKH(String maKhachHang) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Customes kh = (Customes) session.get(Customes.class, maKhachHang);
        session.close();
        return kh;
    }

    public static boolean xoaKhachHang(String maKhachHang) {
       Customes kh = CustomersDAO.layThongTinKH(maKhachHang);
        if (kh == null) {
            return false;
        }
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            session.delete(kh);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.println("Loi");
            return false;
        }
    }
}
