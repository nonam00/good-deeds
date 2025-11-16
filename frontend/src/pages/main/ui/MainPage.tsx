import React from 'react';
import { Navbar } from '@/widgets/navbar/';
import { Sidebar } from '@/widgets/sidebar';
import { MobilePanel } from '@/widgets/mobile-panel';
import { LoginModal, RegisterModal, ViewOrgModal, CreatePointModal } from '@/widgets/modals';
import { CitySearch } from '@/features/city-search';
import { useModalStore } from '@/stores/modal-store';
import styles from './MainPage.module.css';
import {YandexMap} from "@/features/map";

export const MainPage: React.FC = () => {
  const {
    isLoginOpen,
    isRegisterOpen,
    isCreatePointOpen,
    isOrgViewOpen,
    closeAll
  } = useModalStore();

  return (
    <div className={styles.layout}>
      <Navbar />

      <div className={styles.content}>
        <Sidebar/>
        <main className={styles.mainArea}>
          <YandexMap />
          <aside className={styles.rightCol}>
            <CitySearch/>
            <div className={styles.mapPlaceholder}>
              Карта (плейсхолдер)
            </div>
          </aside>
        </main>
      </div>

      <MobilePanel/>

      <footer className={styles.footer}>
        © 2025 Карта добрых дел
      </footer>

      {/* Modals */}
      {isLoginOpen && <LoginModal/>}
      {isRegisterOpen && <RegisterModal/>}
      {isCreatePointOpen && <CreatePointModal/>}
      {isOrgViewOpen && <ViewOrgModal />}

      <div
        className={`${styles.modalOverlay} ${
          isLoginOpen || isRegisterOpen || isCreatePointOpen || isOrgViewOpen ? styles.active : ''
        }`}
        onClick={closeAll}
      />
    </div>
  );
};