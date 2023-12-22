package com.devtam.DevShop.Process;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.devtam.DevShop.Entity.ProductImage;

public interface ProductImageProcess {
	public Map<Integer, List<ProductImage>> getListImages();
	public List<ProductImage> getListImagesById(int id);
	public boolean addImages(int productId, MultipartFile[] files);
}
