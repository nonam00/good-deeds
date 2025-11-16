import React from 'react';
import type {Organization} from '@/shared/lib/constants';
import { useModalStore } from '@/stores/modal-store';
import styles from './OrgCard.module.css';

interface OrgCardProps {
  org: Organization;
}

export const OrgCard: React.FC<OrgCardProps> = ({ org }) => {
  const openOrgView = useModalStore(state => state.openOrgView);

  return (
    <div className={styles.orgCard} onClick={() => openOrgView(org)}>
      <div className={styles.tags}>
        {org.tags.map(tag => (
          <div key={tag} className={styles.tag}>{tag}</div>
        ))}
      </div>
      <div className={styles.orgName}>{org.name}</div>
      <div className={styles.orgAddress}>{org.address}</div>
    </div>
  );
};