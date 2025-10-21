Return-Path: <linux-tegra+bounces-9934-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC7ABF6E7E
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Oct 2025 15:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EA7819A0C73
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Oct 2025 13:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF3A338F5A;
	Tue, 21 Oct 2025 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0Yue/jb"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CBB338935
	for <linux-tegra@vger.kernel.org>; Tue, 21 Oct 2025 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761054865; cv=none; b=W3lQFwaUM8Z1NDP6lhDEXZIJcaOVzPkQ8Vt9wknnTKepdIDIogOj7uXUbpmC5+FQ+m1rzG+aDI3GBsL5S0bhWr/fe2aIhYZoQwn0+fahdxqeSiMUM294+IWcmqJT4Tf2Mxf9a0iiBuOIW37PBX3j9iRa3OZ7Ni+nmjnD2Cfyy9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761054865; c=relaxed/simple;
	bh=1BS07wVlaR+GmTdXUBQw1RRQpTfobfta2+p2OKYdtaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aISTSJrpjcOkKH5X5PUbyzhHOHqvX/ZO6DAg7OQiyLHi51rjQ6HJxLu0OLJPgGCGzEM6bZ5xSZCqJgW6a3jHhOaSrQzRdnvgAwjrHp+F5atJvhoq59jVhxQlDKDHLW2/kfUbobuoLZWjd/Jvh3D0eAZdR/cXbAJq0XP2nLZjipU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0Yue/jb; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-651cda151f0so2264003eaf.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Oct 2025 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761054862; x=1761659662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zRCoVsDUrAKkHnPzEPaybWLTpv8PSDVhOpYhyOZPuA=;
        b=c0Yue/jbJP2Ghd+dfjldfrYr+m2OLEq4lD8+JnuXYzehQBhdMjqIomSxlOvaKPwLpj
         EC+vqy2ChAJD50kopeyChNP9OyaiNmNnuQw1Bd3hv918N6sX3H+EybZYZ/jpUAJYmIiI
         OvId8DJ3wKjeJ8pgKh3cack/buMve2l6cE4/MRz5lTsYMWwtymhoaPYDqNBUaTHrnmQf
         g3CncXw/CYeTY2e4jmzp09aGdHdrQcLI6r5BvL/AlCP5BMTetcqiDsIOOV82BwLryaxa
         ze6nxmuPiOzZTQqqKnL57HD0LtSRlJcdsojRuf6D3g67Bb5ZSXI34egbvkJgojnF9Hwj
         cp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761054862; x=1761659662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zRCoVsDUrAKkHnPzEPaybWLTpv8PSDVhOpYhyOZPuA=;
        b=F7ocXw/IZwYn14nNZmr9yC0Q4uJ1D7cLKH6My8adq0Mnp8DIeuZMX1eDPB3SACLJI5
         vSsuMIXks0GB3q40s8TEMI6BWU2nxU06TM/uoDhyd9tkASMIQaz2b1O2KsQjWwmY1ehi
         Jw98pkMd8fVlfBM42f7yQJ/pmLKlDaJCDTF+1iP4NPVnwYc0rRXY1SNjgUzCbpHPHxH9
         D5aWMU9xM76jzlOR/eceq8j5MAnSVj8OcjU+kyeCkucDiKx+iz/VeHxc4mOwK4s122vc
         jSYYPLOs1pG1m+bRU6rjvcImO6RhARv+QMhrQcqL7rRAZ+NLpPyo4PXHtC9Y2Xa1V2P7
         JJyw==
X-Forwarded-Encrypted: i=1; AJvYcCXixiMfhOMfufwP3BIokgv0uVTfHri2LUiULlyaMSUt7yGfINzEoNQeTatF7LQR8j34mA4GFen9MEFprQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN+Y52Ju14CWS+LvA6uNSyN3apGWL9LHT2KuQy0VH0ytUby3Qq
	SBH9KxfzNb8PdJ734V9wjGWX+wymeMTBxzHs9JPNV07+NmI0KlgPQ4vbOqzlbsUZsow8bVfz5SE
	hNKEojmBB0ORqnQyKpya9V9zlyE3ly4M=
X-Gm-Gg: ASbGncvKSeUdmMydTuh/hQtKVV5ucDT0wObobbTEK4evI7RciROlIy46haOndX8QURW
	Ja5759FzLvWU4OSVXUGYW7QZOEMp0Plg0DP+qeC9qaQdVpRT8GRtealKP611QGp8rJuJPmEyb4y
	3BXdlZKYyil6tYXbnxwdHn+d0D3evse5WzZGJFWU9SyuO1oq8mJesB+eeqJIYWiJgDw1s+CxBv3
	Y/W2B4iWQJ3KrXSIVtbahn0+59G8GXTY+BEpFtHpCF1Vh7q6HX1NgzifryMp+8uQHpiWWUyIVHH
	ZIJB
X-Google-Smtp-Source: AGHT+IEEJhV+7HDnd1rLWzRKPuVeGqK0sxHNPjpMcz5TApDVHa18O8uA1yfTw5iWk/coCiGbH7jCRQhrN34RTrEXqCE=
X-Received: by 2002:a05:6808:1889:b0:43c:afd4:646d with SMTP id
 5614622812f47-443a2ed23f8mr6546477b6e.14.1761054862105; Tue, 21 Oct 2025
 06:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009132006.45834-1-tzimmermann@suse.de> <20251009132006.45834-2-tzimmermann@suse.de>
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 21 Oct 2025 15:54:11 +0200
X-Gm-Features: AS18NWD9WGUNOjZaiHNhwA1jJulHFlj-NuelchpaG-8PGVgNFP5jcKmCav4IxoA
Message-ID: <CAMeQTsbLQcUbFvDMgMoA2EZqO-f5j1fkjtBKWKQmKdMBeJ7Yzw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare fb_helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 3:31=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
>
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
>
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

For gma500:
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>  drivers/gpu/drm/drm_client.c               |  4 ++++
>  drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>  drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>  drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>  drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>  drivers/gpu/drm/msm/msm_fbdev.c            |  2 --
>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
>  drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>  drivers/gpu/drm/tegra/fbdev.c              |  2 --
>  include/drm/drm_client.h                   | 10 ++++++++++
>  14 files changed, 29 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/arma=
da/armada_fbdev.c
> index cb53cc91bafb..22e2081bfa04 100644
> --- a/drivers/gpu/drm/armada/armada_fbdev.c
> +++ b/drivers/gpu/drm/armada/armada_fbdev.c
> @@ -28,8 +28,6 @@ static void armada_fbdev_fb_destroy(struct fb_info *inf=
o)
>         fbh->fb->funcs->destroy(fbh->fb);
>
>         drm_client_release(&fbh->client);
> -       drm_fb_helper_unprepare(fbh);
> -       kfree(fbh);
>  }
>
>  static const struct fb_ops armada_fb_ops =3D {
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm=
/clients/drm_fbdev_client.c
> index f894ba52bdb5..5336accab1b6 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -13,16 +13,28 @@
>   * struct drm_client_funcs
>   */
>
> +static void drm_fbdev_client_free(struct drm_client_dev *client)
> +{
> +       struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(cli=
ent);
> +
> +       drm_fb_helper_unprepare(fb_helper);
> +       kfree(fb_helper);
> +}
> +
>  static void drm_fbdev_client_unregister(struct drm_client_dev *client)
>  {
>         struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(cli=
ent);
>
>         if (fb_helper->info) {
> +               /*
> +                * Fully probed framebuffer device
> +                */
>                 drm_fb_helper_unregister_info(fb_helper);
>         } else {
> +               /*
> +                * Partially initialized client, no framebuffer device ye=
t
> +                */
>                 drm_client_release(&fb_helper->client);
> -               drm_fb_helper_unprepare(fb_helper);
> -               kfree(fb_helper);
>         }
>  }
>
> @@ -88,6 +100,7 @@ static int drm_fbdev_client_resume(struct drm_client_d=
ev *client, bool holds_con
>
>  static const struct drm_client_funcs drm_fbdev_client_funcs =3D {
>         .owner          =3D THIS_MODULE,
> +       .free           =3D drm_fbdev_client_free,
>         .unregister     =3D drm_fbdev_client_unregister,
>         .restore        =3D drm_fbdev_client_restore,
>         .hotplug        =3D drm_fbdev_client_hotplug,
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 3fa38d4ac70b..fe9c6d7083ea 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -168,6 +168,10 @@ void drm_client_release(struct drm_client_dev *clien=
t)
>
>         drm_client_modeset_free(client);
>         drm_client_close(client);
> +
> +       if (client->funcs && client->funcs->free)
> +               client->funcs->free(client);
> +
>         drm_dev_put(dev);
>  }
>  EXPORT_SYMBOL(drm_client_release);
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_=
dma.c
> index 8bd626ef16c7..c6196293e424 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -57,8 +57,6 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *in=
fo)
>         drm_client_buffer_vunmap(fb_helper->buffer);
>         drm_client_framebuffer_delete(fb_helper->buffer);
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops drm_fbdev_dma_fb_ops =3D {
> @@ -92,8 +90,6 @@ static void drm_fbdev_dma_shadowed_fb_destroy(struct fb=
_info *info)
>         drm_client_buffer_vunmap(fb_helper->buffer);
>         drm_client_framebuffer_delete(fb_helper->buffer);
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops drm_fbdev_dma_shadowed_fb_ops =3D {
> diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbde=
v_shmem.c
> index 1e827bf8b815..51573058df6f 100644
> --- a/drivers/gpu/drm/drm_fbdev_shmem.c
> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> @@ -65,8 +65,6 @@ static void drm_fbdev_shmem_fb_destroy(struct fb_info *=
info)
>         drm_client_buffer_vunmap(fb_helper->buffer);
>         drm_client_framebuffer_delete(fb_helper->buffer);
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops drm_fbdev_shmem_fb_ops =3D {
> diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_=
ttm.c
> index 85feb55bba11..ccf460fbc1f0 100644
> --- a/drivers/gpu/drm/drm_fbdev_ttm.c
> +++ b/drivers/gpu/drm/drm_fbdev_ttm.c
> @@ -53,8 +53,6 @@ static void drm_fbdev_ttm_fb_destroy(struct fb_info *in=
fo)
>         drm_client_framebuffer_delete(fb_helper->buffer);
>
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops drm_fbdev_ttm_fb_ops =3D {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/=
exynos/exynos_drm_fbdev.c
> index 93de25b77e68..a3bd21a827ad 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -42,8 +42,6 @@ static void exynos_drm_fb_destroy(struct fb_info *info)
>         drm_framebuffer_remove(fb);
>
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops exynos_drm_fb_ops =3D {
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbde=
v.c
> index a6af21514cff..bc92fa24a1e2 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -84,9 +84,6 @@ static void psb_fbdev_fb_destroy(struct fb_info *info)
>         drm_gem_object_put(obj);
>
>         drm_client_release(&fb_helper->client);
> -
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops psb_fbdev_fb_ops =3D {
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index 3fbdf75415cc..d5f26c8bb102 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -146,8 +146,6 @@ static void intel_fbdev_fb_destroy(struct fb_info *in=
fo)
>         drm_framebuffer_remove(fb_helper->fb);
>
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  __diag_push();
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fb=
dev.c
> index b5969374d53f..aad6fb77f0de 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -52,8 +52,6 @@ static void msm_fbdev_fb_destroy(struct fb_info *info)
>         drm_framebuffer_remove(fb);
>
>         drm_client_release(&helper->client);
> -       drm_fb_helper_unprepare(helper);
> -       kfree(helper);
>  }
>
>  static const struct fb_ops msm_fb_ops =3D {
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapd=
rm/omap_fbdev.c
> index 948af7ec1130..b5df2923d2a6 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -103,8 +103,6 @@ static void omap_fbdev_fb_destroy(struct fb_info *inf=
o)
>         drm_framebuffer_remove(fb);
>
>         drm_client_release(&helper->client);
> -       drm_fb_helper_unprepare(helper);
> -       kfree(helper);
>  }
>
>  /*
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/rade=
on/radeon_fbdev.c
> index dc81b0c2dbff..4df6c9167bf0 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -184,8 +184,6 @@ static void radeon_fbdev_fb_destroy(struct fb_info *i=
nfo)
>         radeon_fbdev_destroy_pinned_object(gobj);
>
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops radeon_fbdev_fb_ops =3D {
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.=
c
> index 1b70f5e164af..91aece6f34e0 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -53,8 +53,6 @@ static void tegra_fbdev_fb_destroy(struct fb_info *info=
)
>         drm_framebuffer_remove(fb);
>
>         drm_client_release(&helper->client);
> -       drm_fb_helper_unprepare(helper);
> -       kfree(helper);
>  }
>
>  static const struct fb_ops tegra_fb_ops =3D {
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bdd845e383ef..eecb8d6e15c7 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -28,6 +28,16 @@ struct drm_client_funcs {
>          */
>         struct module *owner;
>
> +       /**
> +        * @free:
> +        *
> +        * Called when the client gets unregistered. Implementations shou=
ld
> +        * release all client-specific data and free the memory.
> +        *
> +        * This callback is optional.
> +        */
> +       void (*free)(struct drm_client_dev *client);
> +
>         /**
>          * @unregister:
>          *
> --
> 2.51.0
>

