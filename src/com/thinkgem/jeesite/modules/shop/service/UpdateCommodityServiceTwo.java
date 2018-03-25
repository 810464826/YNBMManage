package com.thinkgem.jeesite.modules.shop.service;

import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.lang3.StringUtils;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.modules.shop.entity.Commodity;
import com.thinkgem.jeesite.test.entity.TestTree;

public class UpdateCommodityServiceTwo {
	private static final String START = "{\n\"total\": {count},\n\"classPicture\": \"{classPicture}\",\n\"remarks\": \"{remarks}\",\n\"typename\": \"{typename}\",\n\"result\": [";
	private static final String BLOCK = "{\n\"shopid\":{id},\n\"prices\":{prices},\n\"name\":\"{name}\",\n\"shelves\":\"{shelves}\",\n\"image\": \"{picPath}\",\n\"sales\": \"{sales}\",\n\"popularity\": \"{popularity}\",\n\"time\": \"{time}\",\n\"typeid\": \"{typeid}\"\n}";
	private static final String END = "]}";
	// json 数据文件最大块数
	private static int JSON_MAX = 5;
	org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(UpdateCommodityService.class);
	private static UpdateCommodityServiceTwo updateCommodityService = new UpdateCommodityServiceTwo();

	public static UpdateCommodityServiceTwo getInstance() {
		return updateCommodityService;
	}

	/**
	 * 遍历所有商品,并将商品信息以json的形式输出到josn文件中进行静态化,提高访问效率
	 * @param commodityService2 
	 * @throws Exception 
	 */
	public void buildJsonFileTwo(String dataPath, List<Commodity> commodityList ,List<TestTree> typeList, CommodityService commodityService) throws Exception {
		String prePage = Global.getConfig("goods_pre_page");
		if (!StringUtils.isEmpty(prePage)) {
			JSON_MAX =Integer.parseInt(prePage);
		}
		Commodity data = null;

		// 如果货品数量大于20则每个json文件最大承载20个货品,其他的分文件进行存储
		int size = commodityList.size();
		// 需要的json文件个数
		//int filesCount = size / JSON_MAX + 1;
		int filesCount = typeList.size();
		// 最后的json文件商品条数
		//int lastCount = size % JSON_MAX;
		DecimalFormat decfmt = new DecimalFormat("##0.00");
		for (int i = 0; i < filesCount; i++) {
			String typeName = typeList.get(i).getName();
			String typeId = typeList.get(i).getId();
			String remarks = typeList.get(i).getRemarks();
			String img = typeList.get(i).getImg();
			List<Commodity> goodsList = commodityService.findTypeGoodsList(typeId);
			StringBuffer buf = new StringBuffer();
			int tempSize = 0;
				JSON_MAX = goodsList.size();
				tempSize = JSON_MAX;
			
			buf.append(START.replace("{count}", tempSize + "").replace("{classPicture}", img + "").replace("{remarks}", remarks + "").replace("{typename}", typeName + "")).append("\n");
			//buf.append(START.replace("{remarkes}", remarkes + "")).append("\n");
			
			for (int j = 0; j < JSON_MAX; j++) {
				data = goodsList.get(j);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String time = sdf.format(data.getCreateTime());
//				String time = data.getCreateTime().toString();
				long times=sdf.parse(time).getTime();
				//data.getShelves();
					//File file = new File(Global.getUserfilesBaseDir() + data.getPicture().substring(8));
					//if (null != file && file.isFile()) {
						//BufferedImage sourceImg = ImageIO.read(file);
						buf.append(BLOCK.replace("{id}", data.getId()).replace("{prices}", decfmt.format(data.getMember0()) + "")
								.replace("{name}", data.getName()).replace("{shelves}", data.getShelves().toString()).replace("{picPath}", data.getPicture().substring(13))
								.replace("{sales}", data.getSales().toString()).replace("{popularity}", data.getPopularity().toString()).replace("{time}", String.valueOf(times))
								.replace("{typeid}", data.getCategory())
								);
						if (j != (JSON_MAX - 1)) {
							buf.append(",");
						}
						buf.append("\n");
					//}
				 
			}
			buf.append(END).append("\n");
			writeFile(dataPath, i, buf.toString(),typeId);
		}
	}

	private void writeFile(String dataPath, int i, String string, String typeId) {
		File josnFile = new File(dataPath + "/data/" + typeId + ".json");
		// 下面是向文件data.json里面写数据
		try {
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(josnFile), "UTF-8"));
			out.write(string);
			out.close(); // 关闭数据流

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws IOException {
		System.err.println("/manager/userfiles/4/images/shop/commodity/2016/07/IMG_20140104_132339.jpg".substring(8));
		File file = new File("F:\\Work\\projects\\iyihe\\trunk\\code\\yijiayihe\\WebRoot"
				+ "/manager/userfiles/4/images/shop/commodity/2016/07/IMG_20140104_132339.jpg".substring(8));
		if (null != file && file.isFile()) {
			BufferedImage sourceImg = ImageIO.read(file);
			System.err.println(sourceImg.getHeight());
			System.err.println(sourceImg.getWidth());

			System.err.println((265 * sourceImg.getHeight() / sourceImg.getWidth()));
			System.err.println(sourceImg.getWidth());

			System.err.println(265 / 1840);
		}

	}
}
