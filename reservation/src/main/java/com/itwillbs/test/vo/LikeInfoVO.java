package com.itwillbs.test.vo;

import lombok.Data;

@Data
public class LikeInfoVO {
    private int like_idx;
    private int restaurant_idx;
    private String member_id;
    private boolean liked;

}
