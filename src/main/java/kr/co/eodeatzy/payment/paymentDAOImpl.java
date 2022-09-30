package kr.co.eodeatzy.payment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.eodeatzy.cart.cartDTO;

@Repository
public class paymentDAOImpl implements paymentDAO {

	@Autowired
	private SqlSession sqlSession;
	static final String namespace = "kr.co.eodeatzy.paymentMapper";
	
	//결제하기 
	@Override
	public List<cartDTO> payList(String u_s_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".payList", u_s_id);
	}

	//결제-가게정보
	@Override
	public orderDTO store_info(String u_s_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".store_info", u_s_id);
	}

	//결제-상세정보
	@Override
	public List<cartDTO> orderOne(String u_s_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderOne", u_s_id);
	}
	
	
}
