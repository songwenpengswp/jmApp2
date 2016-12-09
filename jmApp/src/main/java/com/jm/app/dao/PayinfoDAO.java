package com.jm.app.dao;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.jm.app.bean.Payinfo;

/**
 	* A data access object (DAO) providing persistence and search support for Payinfo entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.jm.app.bean.Payinfo
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class PayinfoDAO  {
	     private static final Logger log = LoggerFactory.getLogger(PayinfoDAO.class);
		//property constants
	public static final String MERCH_NO = "merchNo";
	public static final String CERT_NO = "certNo";
	public static final String MOBILE = "mobile";
	public static final String ACCOUNT_NO = "accountNo";
	public static final String ACCOUNT_NAME = "accountName";
	public static final String BANK_NO = "bankNo";
	public static final String BANK_NAME = "bankName";
	public static final String BANK_TYPE = "bankType";
	public static final String FEE = "fee";



    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory){
       this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession(){
     return sessionFactory.getCurrentSession(); 
    }
	protected void initDao() {
		//do nothing
	}
    
    public void save(Payinfo transientInstance) {
        log.debug("saving Payinfo instance");
        try {
            getCurrentSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Payinfo persistentInstance) {
        log.debug("deleting Payinfo instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
	public Payinfo getUniquePayInfo()
	{
		List<Payinfo> payInfoList=this.findAll();
		if(payInfoList!=null && payInfoList.size()>0)
			return payInfoList.get(0);
		return null;
	}
	
    public Payinfo findById( java.lang.Integer id) {
        log.debug("getting Payinfo instance with id: " + id);
        try {
            Payinfo instance = (Payinfo) getCurrentSession()
                    .get("com.jm.app.bean.Payinfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List<Payinfo> findByExample(Payinfo instance) {
        log.debug("finding Payinfo instance by example");
        try {
            List<Payinfo> results = (List<Payinfo>) getCurrentSession() .createCriteria("com.jm.app.bean.Payinfo").add( create(instance) ).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding Payinfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Payinfo as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getCurrentSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List<Payinfo> findByMerchNo(Object merchNo
	) {
		return findByProperty(MERCH_NO, merchNo
		);
	}
	
	public List<Payinfo> findByCertNo(Object certNo
	) {
		return findByProperty(CERT_NO, certNo
		);
	}
	
	public List<Payinfo> findByMobile(Object mobile
	) {
		return findByProperty(MOBILE, mobile
		);
	}
	
	public List<Payinfo> findByAccountNo(Object accountNo
	) {
		return findByProperty(ACCOUNT_NO, accountNo
		);
	}
	
	public List<Payinfo> findByAccountName(Object accountName
	) {
		return findByProperty(ACCOUNT_NAME, accountName
		);
	}
	
	public List<Payinfo> findByBankNo(Object bankNo
	) {
		return findByProperty(BANK_NO, bankNo
		);
	}
	
	public List<Payinfo> findByBankName(Object bankName
	) {
		return findByProperty(BANK_NAME, bankName
		);
	}
	
	public List<Payinfo> findByBankType(Object bankType
	) {
		return findByProperty(BANK_TYPE, bankType
		);
	}
	
	public List<Payinfo> findByFee(Object fee
	) {
		return findByProperty(FEE, fee
		);
	}
	

	public List findAll() {
		log.debug("finding all Payinfo instances");
		try {
			String queryString = "from Payinfo";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Payinfo merge(Payinfo detachedInstance) {
        log.debug("merging Payinfo instance");
        try {
            Payinfo result = (Payinfo) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Payinfo instance) {
        log.debug("attaching dirty Payinfo instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Payinfo instance) {
        log.debug("attaching clean Payinfo instance");
        try {
                      	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
          	            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static PayinfoDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (PayinfoDAO) ctx.getBean("PayinfoDAO");
	}
}