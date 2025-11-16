import React from 'react';
import { useModalStore } from '@/stores/modal-store';
import { Button } from '@/shared/ui/Button/Button';
import styles from './Navbar.module.css';

export const Navbar: React.FC = () => {
  const { openLogin, openCreatePoint } = useModalStore();

  return (
    <header className={styles.navbar}>
      <div className={styles.navLeft}>
        <div className={styles.logo}></div>
        <div className={styles.brand}>
          <div className={styles.companyName}>Карта добрых дел</div>
          <div className={styles.companySub}>карта некоммерческих организаций</div>
        </div>
      </div>

      <div className={styles.navRight}>
        <Button variant="outline" onClick={() => {}}>Моя точка</Button>
        <Button variant="outline" onClick={openCreatePoint}>
          <span className="material-icons">add</span>Добавить точку
        </Button>
        <Button variant="outline" onClick={openLogin}>Войти</Button>
        <div className={styles.notifIcon}>
          <span className="material-icons">mail</span>
        </div>
      </div>
    </header>
  );
};