package com.video.newqu.adapter;

import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.video.newqu.R;
import com.video.newqu.bean.FollowVideoList;
import com.video.newqu.bean.VideoGroupList;
import com.video.newqu.comadapter.BaseQuickAdapter;
import com.video.newqu.comadapter.BaseViewHolder;
import com.video.newqu.model.RecyclerViewSpacesItem;
import com.video.newqu.util.Logger;
import com.video.newqu.util.ScreenUtils;
import java.util.List;


/**
 * TinyHung@Outlook.com
 * 2018/4/11
 * 时间轴展示用户发布的作品
 */

public class GroupVideoListAdapter extends BaseQuickAdapter<VideoGroupList,BaseViewHolder> {
    private RecyclerViewSpacesItem mItemSpacesItemDecoration;

    public GroupVideoListAdapter(List<VideoGroupList> data) {
        super(R.layout.re_item_track_group,data);
    }

    @Override
    protected void convert(BaseViewHolder helper, VideoGroupList item) {
        if(null!=item){
            helper.setText(R.id.tv_item_date, item.getDateTime()+"发布");
            RecyclerView recyclerView = helper.getView(R.id.track_recycler_view);
            if(null!=mItemSpacesItemDecoration){
                recyclerView.removeItemDecoration(mItemSpacesItemDecoration);
            }
            if(null==mItemSpacesItemDecoration){
                mItemSpacesItemDecoration = new RecyclerViewSpacesItem(ScreenUtils.dpToPxInt(1));
            }
            GridLayoutManager gridLayoutManager = new GridLayoutManager(mContext, 3, GridLayoutManager.VERTICAL, false);
            recyclerView.setLayoutManager(gridLayoutManager);
            recyclerView.addItemDecoration(mItemSpacesItemDecoration);
            recyclerView.setNestedScrollingEnabled(false);
            recyclerView.setHasFixedSize(true);
            if(null!=item.getListsBeans()){
                final UserVideoListAdapter videoListAdapter = new UserVideoListAdapter(item.getListsBeans(),3,null);
                recyclerView.setAdapter(videoListAdapter);
                videoListAdapter.setOnItemClickListener(new BaseQuickAdapter.OnItemClickListener() {
                    @Override
                    public void onItemClick(BaseQuickAdapter adapter, View view, int position) {
                        if(null!=mOnItemClickListener){
                            List<FollowVideoList.DataBean.ListsBean> data = videoListAdapter.getData();
                            if(null!=data&&data.size()>0){
                                FollowVideoList.DataBean.ListsBean listsBean = data.get(position);
                                if(null!=listsBean){
                                    mOnItemClickListener.onItemClick(listsBean.getItemIndex());
                                }
                            }
                        }
                    }
                });
            }
        }
    }

    public interface OnItemClickListener{
        void onItemClick(int position);
    }
    private OnItemClickListener mOnItemClickListener;

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        mOnItemClickListener = onItemClickListener;
    }
}
