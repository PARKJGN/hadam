package com.example.domain.scheduletable.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.location.vo.LocationVO;
import com.example.domain.preference.dao.PreferenceDAO;
import com.example.domain.schedule.dao.ScheduleDAO;
import com.example.domain.schedule.vo.PagingVO;
import com.example.domain.schedule.vo.ScheduleVO;
import com.example.domain.scheduletable.dao.ScheduleTableDAO;
import com.example.domain.scheduletable.vo.AiCreateVO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

@Service
public class ScheduleTableServiceImpl implements ScheduleTableService {

	@Autowired
	private ScheduleTableDAO scheduleTableDAO;

	@Autowired
	private ScheduleDAO scheduleDao;

	@Autowired
	private PreferenceDAO preferenceDao;

	// 스케줄표 리스트 가져오기
	public List<ScheduleTableVO> getScheduleTableList(ScheduleTableVO vo) {

		List<ScheduleTableVO> list = scheduleTableDAO.getScheduleTableList(vo);

		return list;
	}

	// 스케줄 리스트 가져오기
	public List<ScheduleTableVO> getScheduleList() {

		return scheduleTableDAO.getScheduleList();
	}

	// 해당하는 스케줄테이블 가져오기
	public List<ScheduleTableVO> getScheduleTable(ScheduleTableVO vo) {

		return scheduleTableDAO.getScheduleTable(vo);
	}

	// 스케줄 테이블 id 가져오기
	public Integer getScheduleTableId(ScheduleTableVO svo) {

		return scheduleTableDAO.getScheduleTableId(svo);
	}

	// 스케줄표 하나 가져오기
	public ScheduleTableVO getSchedule(ScheduleTableVO svo) {

		return scheduleTableDAO.getSchedule(svo);
	}

	// 스케줄표 상태 업데이트
	public void updateScheduleTableStatus(ScheduleTableVO vo) {

		scheduleTableDAO.updateScheduleTableStatus(vo);

	}

	// 스케줄 테이블 id 리스트 가져오기
	public List<ScheduleTableVO> getScheduleTableBoardList(PagingVO pvo) {
		
		
		 pvo.setTotalCount(scheduleTableDAO.scheduleTableListSize(pvo));
		 System.out.println("pagingsize확인"+pvo);
		 
		return scheduleTableDAO.getScheduleTableBoardList(pvo);
	}

	// boardId값 넘겨받아 스케줄테이블 리스트 출력
	public List<ScheduleTableVO> getScheduleDataByBoardId(Integer boardId) {

		return scheduleTableDAO.getScheduleDataByBoardId(boardId);
	}

	// 수정할 스케줄에서 boardId 가져오기
	public ScheduleTableVO getBoardIdByScheduleTable(Integer boardId) {

		return scheduleTableDAO.getBoardIdByScheduleTable(boardId);
	}

	// 수정시 기존에 있던 boardStatus 대기로 바꾸기
	public void updateScheduleTableStatusToWait(BoardVO vo) {

		scheduleTableDAO.updateScheduleTableStatusToWait(vo);
	}

	@Transactional
	public void insertScheduleTable(ScheduleTableVO stvo) {

		// 스케줄표 insert
		scheduleTableDAO.insertScheduleTable(stvo);

		// 셀렉키로 stvo에 스케줄테이블id가 들어가있음
		Integer scheduleTableId = stvo.getScheduleTableId();

		// 스케줄 insert
		List<ScheduleVO> svoList = stvo.getScheduleList();
		scheduleDao.insertScheduleList(svoList, scheduleTableId, stvo.getMemberIndex());
	}

	// 내 스케줄 삭제 [최성익]
	public Integer scheduleDelete(Integer scheduleTableId) {
		return scheduleTableDAO.scheduleDelete(scheduleTableId);
	}
	
	// 스케줄 공유 게시판 검색
	public List<ScheduleTableVO> searchScheduleBoards(BoardVO vo) {
		
		return scheduleTableDAO.searchScheduleBoards(vo);
	}
	
	@Override
	@Transactional
	public List<LocationVO> aiCreateScheduleTable(AiCreateVO aivo, Integer memberIndex) {

		// 현재 유저의 취향 소분류 카테고리로 가지고오기
		List<String> preferenceList = preferenceDao.SelectPreferenceByMemberIndex(memberIndex, aivo.getCategoryList());
		System.out.println("선호도" + preferenceList);

		// 유저가 선택한 대분류 카테고리
		List<String> largeCate = aivo.getCategoryList();

		// 알고리즘을 통해 뽑아온 추천 리스트
		List<LocationVO> aiList = scheduleTableDAO.aiCreateScheduleTable(aivo, preferenceList, 0);
		
		System.out.println("리스트" + aiList);

		// 뽑아온 추천 리스트에서 사용자가 선택한 태그들을 하나씩만 넣은 최종으로 넘겨줄 list
		List<LocationVO> submitList = new ArrayList<LocationVO>();

		// 추천 리스트에서 안나온 대분류 태그를 확인하기 위한 2중 포문
		for (int i = 0; i < largeCate.size(); i++) {
			for (int j = 0; j < aiList.size(); j++) {
				if (largeCate.get(i).equals(aiList.get(j).getLargeCategory())) {
					submitList.add(aiList.get(j));
					largeCate.remove(i);
					i--;
					break;
				}
			}
		} // end of for 첫번째 알고리즘 리스트 대분류 확인
		
		System.out.println("여기야?!!");

		// 안나온 대분류 태그가 있으면
		if (largeCate.size() != 0) {
			// 안나온 대분류 카테고리로 유저의 취향 소분류 카테고리 다시 들고오기
			System.out.println(largeCate);
			preferenceList = preferenceDao.SelectPreferenceByMemberIndex(memberIndex, largeCate);
			System.out.println("여기야!" + preferenceList);
			// 위도 경도에 +- 0.015내에서 찾던 것을 +- 0.03 넓혀서 찾는데 기존 범위는 제외 그래야 중복 장소가 나오지 않는다.
			aiList = scheduleTableDAO.aiCreateScheduleTable(aivo, preferenceList, 1);

			// 다시 찾은 것중에서 대분류 태그 확인
			for (int i = 0; i < largeCate.size(); i++) {
				for (int j = 0; j < aiList.size(); j++) {
					if (largeCate.get(i).equals(aiList.get(j).getLargeCategory())) {
						submitList.add(aiList.get(j));
						largeCate.remove(i);
						i--;
						break;
					}
				}
			} // end of for 두번째 알고리즘 리스트 대분류 확인

			// 두번째 알고리즘 추천 후에도 안나온 대분류 태그가 있으면 그때는 대분류카테고리로 셀렉
			if (largeCate.size() != 0) {
				System.out.println(largeCate);
				aiList = scheduleTableDAO.CreateScheduleTable(aivo, largeCate);
				System.out.println("유사도 없는 list" + aiList);
				for (int i = 0; i < largeCate.size(); i++) {
					for (int j = 0; j < aiList.size(); j++) {
						if (largeCate.get(i).equals(aiList.get(j).getLargeCategory())) {
							submitList.add(aiList.get(j));
							largeCate.remove(i);
							i--;
							break;
						}
					}
				}
				if(largeCate.size() !=0 ) {
					// 끝까지 없으면 빈 리스트 보낸 후 사용자에게 추천 장소가 없습니다 띄워주기
					System.out.println("진짜 끝까지 없어?");
					submitList.clear();
					return submitList;
				}
				
			} else {
				return submitList;
			}

		} // end of if 안나온 태그있으면 다시 리스트 추천

		else {
			// 한번에 다 나왔으면
			return submitList;
		} // end of else 안나온 대분류 태그

		return submitList;

	} // end of aiCreateScheduleTable
}
