import React, { useState } from 'react';
import { useOrgsStore } from '@/stores/orgs-store';
import { Input } from '@/shared/ui/Input/Input';
import { FilterItem } from '@/features/filters/ui/FilterItem';
import { OrgCard } from '@/features/orgs/ui/OrgCard';
import { Button } from '@/shared/ui/Button/Button';
import styles from './MobilePanel.module.css';

export const MobilePanel: React.FC = () => {
  const [isOpen, setIsOpen] = useState(false);
  const { filters, searchQuery, setSearchQuery, filteredOrgs } = useOrgsStore();

  return (
    <div className={`${styles.mobilePanel} ${isOpen ? styles.open : ''}`}>
      <div className={styles.panelHeader} onClick={() => setIsOpen(!isOpen)}></div>
      <div className={styles.mobileContent}>
        <div className={styles.searchBox}>
          <span className={`material-icons ${styles.searchIcon}`}>search</span>
          <Input
            placeholder="Поиск по названию"
            value={searchQuery}
            onChange={setSearchQuery}
          />
        </div>

        <h3 className={styles.filtersTitle}>Фильтры</h3>
        <div className={styles.filtersGrid}>
          {filters.map(filter => (
            <FilterItem key={filter.name} filter={filter} />
          ))}
        </div>

        <div className={styles.found}>
          Найдено: <span>{filteredOrgs.length}</span>
        </div>

        <div className={styles.orgList}>
          {filteredOrgs.map((org, index) => (
            <OrgCard key={index} org={org} />
          ))}
        </div>

        <div className={styles.closeButton}>
          <Button variant="outline" onClick={() => setIsOpen(false)}>
            Закрыть
          </Button>
        </div>
      </div>
    </div>
  );
};