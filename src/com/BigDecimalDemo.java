package com;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class BigDecimalDemo {
	public static void main(String[] args) {
		System.out.println(ArithUtil.add(0.01, 0.05));
		System.out.println(ArithUtil.sub(1.0, 0.42));
		System.out.println(ArithUtil.mul(4.015, 100));
		System.out.println(ArithUtil.div(123.3, 100));
		
		System.out.println(ArithUtil.round(ArithUtil.add(0.01, 0.015),2,BigDecimal.ROUND_HALF_EVEN));
		System.out.println(ArithUtil.round(ArithUtil.sub(1.0, 0.42),2,BigDecimal.ROUND_HALF_EVEN));
		System.out.println(ArithUtil.round(ArithUtil.mul(4.015, 100),2,BigDecimal.ROUND_HALF_EVEN));
		System.out.println(ArithUtil.round(ArithUtil.div(123.3, 100),2,BigDecimal.ROUND_HALF_EVEN));
		DecimalFormat decfmt = new DecimalFormat("##0.000");   
       System.out.println(decfmt.format(1222.33482222)); 
		float price=89.89f;
		int itemNum=2;
		float totalPrice=price*itemNum;
		float num=(float)(Math.round(totalPrice*1000)/1000);//如果要求精确4位就*10000然后/10000
		System.err.println(totalPrice+":"+num);
	}
}

class ArithUtil {
	private static final int DEF_DIV_SCALE = 10;

	private ArithUtil() {
	}

	/**
	 * 对double数据进行取精度.
	 * 
	 * @param value
	 *            double数据.
	 * @param scale
	 *            精度位数(保留的小数位数).
	 * @param roundingMode
	 *            精度取值方式.
	 * @return 精度计算后的数据.
	 */
	public static double round(double value, int scale, int roundingMode) {
		BigDecimal bd = new BigDecimal(value);
		bd = bd.setScale(scale, roundingMode);
		double d = bd.doubleValue();
		bd = null;
		return d;
	}

	public static double add(double d1, double d2) {
		BigDecimal b1 = new BigDecimal(Double.toString(d1));
		BigDecimal b2 = new BigDecimal(Double.toString(d2));
		return b1.add(b2).doubleValue();

	}

	public static double sub(double d1, double d2) {
		BigDecimal b1 = new BigDecimal(Double.toString(d1));
		BigDecimal b2 = new BigDecimal(Double.toString(d2));
		return b1.subtract(b2).doubleValue();

	}

	public static double mul(double d1, double d2) {
		BigDecimal b1 = new BigDecimal(Double.toString(d1));
		BigDecimal b2 = new BigDecimal(Double.toString(d2));
		return b1.multiply(b2).doubleValue();

	}

	public static double div(double d1, double d2) {

		return div(d1, d2, DEF_DIV_SCALE);

	}

	public static double div(double d1, double d2, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException("The scale must be a positive integer or zero");
		}
		BigDecimal b1 = new BigDecimal(Double.toString(d1));
		BigDecimal b2 = new BigDecimal(Double.toString(d2));
		return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();

	}

}
