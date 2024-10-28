<?php

namespace iutnc\deefy\dispatch;

use iutnc\deefy\action\DefaultAction;
use iutnc\deefy\action\DisplayPlaylistAction;
use iutnc\deefy\action\AddPlaylistAction;
use iutnc\deefy\action\AddPodcastTrackAction;

class Dispatcher {
    private ?string $action;

    public function __construct() {
        $this->action = $_GET['action'] ?? 'default';
    }

    public function run(): void {
        switch ($this->action) {
            case 'playlist':
                $action = new DisplayPlaylistAction();
                break;
            case 'add-playlist':
                $action = new AddPlaylistAction();
                break;
            case 'add-track':
                $action = new AddPodcastTrackAction();
                break;
            case 'default':
            default:
                $action = new DefaultAction();
                break;
        }
        try {
            $this->renderPage($action->execute());
        } catch (\Exception $e) {
            $this->renderPage('<div class="error">Error: ' . $e->getMessage() . '</div>');
        }
    }

    private function renderPage(string $html): void {
        echo "$html";
    }
}