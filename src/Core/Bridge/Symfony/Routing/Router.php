<?php

/*
 * This file is part of the API Platform project.
 *
 * (c) Kévin Dunglas <dunglas@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

declare(strict_types=1);

namespace ApiPlatform\Core\Bridge\Symfony\Routing;

class_exists(\ApiPlatform\Symfony\Routing\Router::class);

if (false) {
    final class Router extends \ApiPlatform\Symfony\Routing\Router
    {
    }
}