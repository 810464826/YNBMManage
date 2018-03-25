package com.thinkgem.jeesite.modules.shop.service;

import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.DecimalFormat;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.lang3.StringUtils;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.modules.shop.entity.Commodity;

public class UpdateCommodityService {
	private static final String START = "{\n\"total\": {count},\n\"result\": [";
	private static final String BLOCK = "{\n\"shopid\":{id},\n\"prices\":{prices},\n\"name\":\"{name}\",\n\"image\": \"{picPath}\",\n\"width\": {width},\n\"heigth\": {heigth}\n}";
	private static final String END = "]}";
	// json 数据文件最大块数
	private static int JSON_MAX = 5;
	org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(UpdateCommodityService.class);
	private static UpdateCommodityService updateCommodityService = new UpdateCommodityService();

	public static UpdateCommodityService getInstance() {
		return updateCommodityService;
	}

	/**
	 * 遍历所有商品,并将商品信息以json的形式输出到josn文件中进行静态化,提高访问效率
	 */
	public void buildJsonFile(String dataPath, List<Commodity> commodityList) {
		String prePage = Global.getConfig("goods_pre_page");
		if (!StringUtils.isEmpty(prePage)) {
			JSON_MAX =Integer.parseInt(prePage);
		}
		Commodity data = null;

		// 如果货品数量大于20则每个json文件最大承载20个货品,其他的分文件进行存储
		int size = commodityList.size();
		// 需要的json文件个数
		int filesCount = size / JSON_MAX + 1;
		// 最后的json文件商品条数
		int lastCount = size % JSON_MAX;
		DecimalFormat decfmt = new DecimalFormat("##0.00");
		for (int i = 0; i < filesCount; i++) {
			StringBuffer buf = new StringBuffer();
			int tempSize = 0;
			if (i == filesCount - 1) {
				tempSize = lastCount;
			} else {
				tempSize = JSON_MAX;
			}
			buf.append(START.replace("{count}", tempSize + "")).append("\n");
			for (int j = (0 + i * JSON_MAX); j < (tempSize + i * JSON_MAX); j++) {
				data = commodityList.get(j);
				try {
					File file = new File(Global.getUserfilesBaseDir() + data.getPicture());
					if (null != file && file.isFile()) {
						BufferedImage sourceImg = ImageIO.read(file);
						buf.append(BLOCK.replace("{id}", data.getId()).replace("{prices}", decfmt.format(data.getMember0()) + "")
								.replace("{name}", data.getName()).replace("{picPath}", data.getPicture().substring(8))
								.replace("{width}", "265")
								.replace("{heigth}", 265 * sourceImg.getHeight() / sourceImg.getWidth() + ""));
						if (j != (tempSize + i * JSON_MAX) - 1) {
							buf.append(",");
						}
						buf.append("\n");
					}
				} catch (IOException e) {
					logger.error("读取商品图片失败", e);
				}
			}
			buf.append(END).append("\n");
			writeFile(dataPath, i, buf.toString());
		}
	}

	private void writeFile(String dataPath, int i, String string) {
		File josnFile = new File(dataPath + "/data/data" + (i + 1) + ".json");
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
