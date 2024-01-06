package com.example.domain.favorites.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FavoritesVO {

	private Integer favoritesId;
	private Integer memberIndex;
	private Integer locationId;
}
