
import com.DAOS.CategoryDAO;
import com.DAOS.EmployeeDAO;
import com.DAOS.FoodDAO;
import com.DAOS.MakePaymentDAO;
import com.DAOS.OrderDAO;
import com.DAOS.TableDAO;
import com.Models.Category;
import com.Models.Employee;
import com.Models.Foods;
import com.Models.MakePayment;
import com.Models.OrderModel;
import com.Models.Table;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author vhqua
 */
public class test {

    public static void main(String[] args) {
//        String orderString = "/F00001,1/F00002,3/F00021,2/F00041,1/F00081,1";
//        orderString = orderString.substring(1);
//        HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
//        // split the String by a comma
//        String parts[] = orderString.split("/");
//        // iterate the parts and add them to a HashMap
//        for (String part : parts) {
//            // split the student data by colon to get the
//            // name and roll number
//            String orderData[] = part.split(",");
//            String OrderFoodID = orderData[0].trim();
//            int OrderFoodAmount = Integer.parseInt(orderData[1].trim());
//            // Add to map
//            hashMap.put(OrderFoodID, OrderFoodAmount);
//            String tableID = "T0005";
//            OrderDAO orderdao = new OrderDAO();
//
//            String orderID = "ODTEST10";
//            for (String foodID : hashMap.keySet()) {
//                orderdao.addNewOrder(new OrderModel(orderID, hashMap.get(foodID), tableID, foodID));
//            }
//        }
//        List<OrderModel> listOr = new ArrayList<>();
//        OrderDAO ordao = new OrderDAO();
//        listOr = ordao.getOrder("ODTEST18");
//        FoodDAO fdao = new FoodDAO();
//        for (OrderModel orderModel : listOr) {
//            System.out.println(orderModel.getFood_ID() + ", " + fdao.getFoodName(orderModel.getFood_ID()) + ", " + orderModel.getQuantity() + ", " + fdao.getFoodPrice(orderModel.getFood_ID()));
//        }
//
//        MakePaymentDAO mdao = new MakePaymentDAO();
////            mdao.addNewMakePM(new MakePayment("hahaa1", 20000, "false", "E0002", "T0001"));
//
////           mdao.setMakePMStatus("PMOD-1501798605", "true");
////           MakePayment mp = mdao.getPaymentID("PMOD-1501798605");
////           System.out.println(mp.getMP_Status());
//        MakePaymentDAO mpdao = new MakePaymentDAO();
//        List<MakePayment> list = mpdao.getAllMakePM();
//        for (MakePayment makePayment : list) {
//            System.out.println(makePayment);
//        }
        FoodDAO fdao = new FoodDAO();
        System.out.println(fdao.getFoodStatus("F00001"));
    }
}
