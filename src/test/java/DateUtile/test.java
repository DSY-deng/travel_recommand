package DateUtile;

import java.util.Date;

public class test {
    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(date);

        System.out.println(date.getYear()+1900);
        System.out.println(date.getMonth()+1);
        System.out.println(date.getDate());
    }
}
