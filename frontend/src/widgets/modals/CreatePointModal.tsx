import React, { useState } from 'react';
import { useModalStore } from '@/stores/modal-store';
import { Input } from '@/shared/ui/Input/Input';
import { Button } from '@/shared/ui/Button/Button';
import styles from './Modals.module.css';

export const CreatePointModal: React.FC = () => {
  const { closeAll, isCreatePointOpen } = useModalStore();
  const [selectedTags, setSelectedTags] = useState<Set<string>>(new Set());
  const [fileName, setFileName] = useState('');

  if (!isCreatePointOpen) {
    return null;
  }

  const tags = [
    "Бизнес", "Экология", "Образование", "Сообщество", "Право",
    "Медицина", "Благотворительность", "Спорт", "Соц. поддержка",
    "Наука", "Культура", "Религия"
  ];

  const toggleTag = (tag: string) => {
    const newTags = new Set(selectedTags);
    if (newTags.has(tag)) {
      newTags.delete(tag);
    } else {
      newTags.add(tag);
    }
    setSelectedTags(newTags);
  };

  const handleFileChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (file) {
      setFileName(file.name);
    }
  };

  return (
    <div className={`${styles.modal} ${styles.active}`}>
      <div className={styles.modalHeader}>
        <h3>Создание точки НКО</h3>
        <span className={styles.modalClose} onClick={closeAll}>&times;</span>
      </div>

      <Input placeholder="Название точки" />
      <Input placeholder="Описание" />
      <Input placeholder="Номер телефона" />
      <Input placeholder="Город" />
      <Input placeholder="Адрес" />
      <Input placeholder="Социальные сети" />

      <label className={styles.logoUpload}>
        <span className={styles.logoLabel}>Логотип</span>
        <input
          type="file"
          hidden
          onChange={handleFileChange}
        />
        <div className={`${styles.fileStatus} ${fileName ? styles.success : ''}`}>
          {fileName || ''}
        </div>
        <span className={styles.logoPlus}>+</span>
      </label>

      <h4 className={styles.mt10}>Вид деятельности</h4>

      <div className={styles.tagsSelect}>
        {tags.map(tag => (
          <div
            key={tag}
            className={`${styles.tagOption} ${selectedTags.has(tag) ? styles.active : ''}`}
            onClick={() => toggleTag(tag)}
          >
            {tag}
          </div>
        ))}
      </div>

      <label className={styles.checkboxRow}>
        <input type="checkbox" />
        <span>Я соглашаюсь с предоставлением и обработкой своих персональных данных</span>
      </label>

      <Button className={styles.w100}>Создать точку</Button>
    </div>
  );
};