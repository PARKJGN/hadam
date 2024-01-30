package com.example.domain.entry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.chat.vo.ChatRoomVO;
import com.example.domain.entry.vo.EntryApplicationVO;

@Mapper
public interface EntryDAO {
	
	// 스케줄 참가하기 버튼클릭시 저장
	void scheduleAttendSave(EntryApplicationVO vo);

	// entry 삭제
	void deleteEntry(Integer boardId);
	
	// 마이페이지 참가신청 리스트 가져오기 [최성익]
	List<EntryApplicationVO> mypageEntry(Integer memberIndex);

	// entry 명단 확인
	EntryApplicationVO checkEntry(EntryApplicationVO vo);
	
	// 동행신청 수락 [최성익]
	Integer entryAccept(Integer boardId, Integer guestMemberIndex);
	
	// 동행신청 거절 [최성익]
	Integer entryRejection(Integer boardId, Integer guestMemberIndex);
}
