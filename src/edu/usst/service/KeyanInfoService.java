package edu.usst.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.usst.dao.KeyanInfoDao;
import edu.usst.model.Magazine;
import edu.usst.model.Paper;
@Service
public class KeyanInfoService {
	@Resource(name="keyanInfoDao")
	private KeyanInfoDao keyanInfoDao;
	public List<Paper> getKeyaninfo(){
		List<Paper> apply= keyanInfoDao.keyaninfo();
		return apply;
	}
	
	
	
	public String keyaninfodele(String userId, String biaoname){
		String c=keyanInfoDao.keyaninfodele(userId,biaoname);
		return c;
	}
	
	public List<Magazine> magazine(){
		List<Magazine> ml=keyanInfoDao.magezine();
		return ml;
	}
	//s_paper
	public String magazineadd(String name,String level,String issn,String cn,String type){
		String c=keyanInfoDao.magazineadd(name, level, issn, cn, type);
		return c;
	}

	public String keyaninfoupdate(String PROJECT_SOURCE_ID,String NAME,String PAPER_MODE_ID,String PUBLISH_UNIT,String FIRST_AUTHOR_NAME,String OTHER_AUTHOR_NAME,String PUBLISH_DATE,String WORD_NUMBER,String CHECK_STATUS_ID,int id,String fILE_IDS){
		String c=keyanInfoDao.keyaninfoupdate(PROJECT_SOURCE_ID, NAME, PAPER_MODE_ID, PUBLISH_UNIT, FIRST_AUTHOR_NAME, OTHER_AUTHOR_NAME, PUBLISH_DATE, WORD_NUMBER, CHECK_STATUS_ID,id,fILE_IDS);
		return c;
	}
//s_book
	public String keyaninfoadd(String pROJECT_SOURCE_ID, String nAME,
			String fIRST_AUTHOR_NAME, String oTHER_AUTHOR_NAME,
			String pUBLISH_UNIT, String pUBLISH_DATE, String wORD_NUMBER,
			String rEMARK, String eDITOR, String string) {
		
		String c=keyanInfoDao.keyaninfoadd(pROJECT_SOURCE_ID, nAME, fIRST_AUTHOR_NAME, oTHER_AUTHOR_NAME, pUBLISH_UNIT, pUBLISH_DATE, wORD_NUMBER, rEMARK, eDITOR, string);
	      return c;
	}

	    public String keyaninfoupdate(int parseInt,
			String pROJECT_SOURCE_ID, String nAME, String fIRST_AUTHOR_NAME,
			String oTHER_AUTHOR_NAME, String pUBLISH_UNIT, String pUBLISH_DATE,
			String wORD_NUMBER, String rEMARK, String eDITOR, String string) {
		String c=keyanInfoDao.keyaninfoupdate(parseInt,pROJECT_SOURCE_ID, nAME, fIRST_AUTHOR_NAME, oTHER_AUTHOR_NAME, pUBLISH_UNIT, pUBLISH_DATE, wORD_NUMBER, rEMARK, eDITOR, string);
	      return c;
	}

		public String keyaninfoadd(String pROJECT_SOURCE_ID, String nAME,
				String fIRST_AUTHOR_NAME, String oTHER_AUTHOR_NAME,
				String uNIT, String pRIZE_DATE, String lEVEL) {
			String c=keyanInfoDao.keyaninfoadd(pROJECT_SOURCE_ID, nAME, uNIT, fIRST_AUTHOR_NAME, oTHER_AUTHOR_NAME, pRIZE_DATE,lEVEL);
		
		return c;}

		public String keyaninfoupdate(int parseInt, String pROJECT_SOURCE_ID,
				String nAME, String fIRST_AUTHOR_NAME,
				String oTHER_AUTHOR_NAME, String uNIT, String pRIZE_DATE,
				String lEVEL) {
			String c=keyanInfoDao.keyaninfoupdate(parseInt,pROJECT_SOURCE_ID, nAME, fIRST_AUTHOR_NAME, oTHER_AUTHOR_NAME, uNIT, pRIZE_DATE, lEVEL);
		      return c;
		}

		public String keyaninfoadd(String nAME, String uNIT, String dATE,
				String cONTENT, String rEMARK) {
			String c=keyanInfoDao.keyaninfoadd( nAME, uNIT, dATE,cONTENT,rEMARK);
			
			return c;
		}

		public String keyaninfoupdate(int parseInt, String nAME, String uNIT,
				String dATE, String cONTENT, String rEMARK) {
            String c=keyanInfoDao.keyaninfoupdate(parseInt, nAME, uNIT, dATE,cONTENT,rEMARK);
			
			return c;
		}

		public String keyaninfoadd(String nAME, String uNIT, String dATE,
				String tYPE, String fROM, String rOLE, String aCHIEVE,
				String cHARGE, String mONEY, int i) {
			String c=keyanInfoDao.keyaninfoadd( nAME, uNIT,  dATE,
					 tYPE, fROM,  rOLE, aCHIEVE,
					 cHARGE,  mONEY, i);
			return c;
		}

		public String keyaninfoupdate(String nAME, String uNIT, String dATE,
				String tYPE, String fROM, String rOLE, String aCHIEVE,
				String cHARGE, String mONEY, String id) {
			String c=keyanInfoDao.keyaninfoupdate(nAME,  uNIT,  dATE,
					 tYPE,  fROM,  rOLE,  aCHIEVE,
					 cHARGE,  mONEY,  id);
			return c;
		}
//paper
		public String keyaninfoadd(String pROJECT_SOURCE_ID, String nAME,
				String pAPER_MODE_ID, String pUBLISH_UNIT,
				String fIRST_AUTHOR_NAME, String oTHER_AUTHOR_NAME,
				String pUBLISH_DATE, String wORD_NUMBER,
				String cHECK_STATUS_ID, String fILE_IDS, int i) {
			String c=keyanInfoDao.keyaninfoadd(pROJECT_SOURCE_ID, nAME, pAPER_MODE_ID, pUBLISH_UNIT, fIRST_AUTHOR_NAME, oTHER_AUTHOR_NAME, pUBLISH_DATE, wORD_NUMBER, cHECK_STATUS_ID,fILE_IDS,i);
			return c;
		}
	
}