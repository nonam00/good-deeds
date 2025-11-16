import React from 'react';
import { useModalStore } from '@/stores/modal-store';
import styles from './Modals.module.css';

export const ViewOrgModal: React.FC = () => {
  const { closeAll, selectedOrg, isOrgViewOpen } = useModalStore();

  if (!selectedOrg || !isOrgViewOpen) return null;

  return (
    <div className={`${styles.modal} ${styles.active}`}>
      <div className={styles.modalHeader}>
        <span className={styles.modalClose} onClick={closeAll}>&times;</span>
      </div>

      <img
        id="org-view-logo"
        src={selectedOrg.logo || "/img/default.png"}
        style={{width:'140px',borderRadius:'10px',marginBottom:'15px'}}
        alt={selectedOrg.name}
      />

      <div className={styles.tags} style={{marginBottom:'12px'}}>
        {selectedOrg.tags?.map(tag => (
          <div key={tag} className={styles.tag}>{tag}</div>
        ))}
      </div>

      <div style={{fontWeight:'700',fontSize:'20px',marginBottom:'6px',color:'#333'}}>
        {selectedOrg.name}
      </div>

      <div style={{color:'#555',marginBottom:'18px'}}>
        {selectedOrg.address}
      </div>

      <h4 style={{marginTop:'10px',marginBottom:'6px'}}>Описание</h4>
      <div style={{whiteSpace:'pre-line',color:'#333'}}>
        {selectedOrg.description || "Описание отсутствует"}
      </div>

      <h4 style={{marginTop:'16px',marginBottom:'6px'}}>Контакты</h4>
      <div>
        {selectedOrg.phone && <div><b>Телефон:</b> {selectedOrg.phone}</div>}
        {selectedOrg.email && <div><b>Email:</b> {selectedOrg.email}</div>}
        {selectedOrg.site && <div><b>Сайт:</b> <a href={selectedOrg.site} target="_blank" rel="noopener noreferrer">{selectedOrg.site}</a></div>}
      </div>

      <h4 style={{marginTop:'16px',marginBottom:'6px'}}>Мероприятия</h4>
      <div>
        {selectedOrg.events?.length ? (
          selectedOrg.events.map((event, index) => (
            <div key={index} style={{marginBottom:'6px'}}>{event}</div>
          ))
        ) : (
          "Нет мероприятий"
        )}
      </div>
    </div>
  );
};