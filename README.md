# NSW Math Quest — Shared Supabase + Autosave

## What changed

- Student profiles load from the shared `students` table.
- The app registers as `nsw-math-quest` in the shared `apps` table.
- Every submitted answer is automatically saved to `student_results`.
- Progress is saved after correct and incorrect attempts.
- Each student's totals, accuracy and response times are restored when they return to the same stage.
- A local device backup is created immediately.
- Failed online saves are queued and retried when the device reconnects.
- Each cloud save includes an exact timestamp and top-level `activity_name`.

## Deploy

1. Run `setup.sql` once in the shared Supabase project.
2. Create a new GitHub repository.
3. Upload all files in this folder to the repository root.
4. Import the repository into Vercel.
5. Embed the Vercel URL in Google Sites.

No Gemini key is needed for this app.
