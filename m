Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1341A8AD3
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Apr 2020 21:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504844AbgDNTcp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Apr 2020 15:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504843AbgDNTcP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Apr 2020 15:32:15 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97AEC061A41
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 12:32:14 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g12so7767708wmh.3
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 12:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r6dF4D+wN0hoeI/HD/8hpNX9Zi5cUiRTSVM80fnZiTg=;
        b=fBwO8IzrniZxcSL/9GbflmZPAl8MqOi6BSiWdmNVZDtvwiDrXcJ8sFwXX48lFfCr/X
         wAgnGE8TBRQDx7zep17eczot4owoqocmojJ2B1UIF3996KL5H5yKdjPmNSVnUf4AqjNa
         rln2yoActQTeguQWHfcZC3czrrvZnhzuMvVik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r6dF4D+wN0hoeI/HD/8hpNX9Zi5cUiRTSVM80fnZiTg=;
        b=rnzrm71xQ+HyfmZL9pBoMnApoYIanla4MZzY+19EeQKS9u/0sa7yho2C0QunO7AgU+
         P2BLzbFXFzSyRz5v3cb/lC6/pLeIe9iFgFu8dJiSGV8yKvlClX6gCUo5OGZSsBZgjJDp
         IIZ00Vmej7honK8RInbTKaBz9sfb0u8qlaIt3CGGFs4z0TWzPFRIgdN8eGO7alMNoWi3
         1+vznoYwo4LG254iAXJXNx+rsWwOfWnox/HXAaMoOIJEbx/mEwfT0+ECmQz+UqQnVX9t
         mMz3l9wuUnqzYxiCrEjhID978wCqMq3l73dQcGCM46m/c/94w/+W7MH2EnQGvH1x+wYY
         rcxg==
X-Gm-Message-State: AGi0PuYbkh/4VCnm5T9HRQfuLFX3LUan5MJFxgAsspUftWBwnE2mo9zL
        2vGyFOj/gHfYcGvnWC9oFCWcbMPVmbi1uVRwtld7Fw==
X-Google-Smtp-Source: APiQypLlztDYYEwUmNspxfYCm4X+JL6rjJrBiwa1m4IaNyse2DCEG6Vj7c7I41oPprzB2RKLqJ1TOmG77/BhEZSyEk4=
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr1303254wmj.12.1586892732880;
 Tue, 14 Apr 2020 12:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200306002112.255361-1-dbasehore@chromium.org> <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com>
In-Reply-To: <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com>
From:   "dbasehore ." <dbasehore@chromium.org>
Date:   Tue, 14 Apr 2020 12:32:01 -0700
Message-ID: <CAGAzgsqpjZxh7PEL_Dy7HrFeFGm7+=F6cL3QG9KmK9CHvDWZ9g@mail.gmail.com>
Subject: Re: [PATCH v10 0/2] Panel rotation patches
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry, sorry for the late reply.

On Sun, Mar 8, 2020 at 12:25 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 06.03.2020 03:21, Derek Basehore =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > This adds the plumbing for reading panel rotation from the devicetree
> > and sets up adding a panel property for the panel orientation on
> > Mediatek SoCs when a rotation is present.
>
> Hello Derek and everyone,
>
> I'm looking at adding display rotation support to NVIDIA Tegra DRM
> driver because some devices have display panel physically mounted
> upside-down, and thus, display controller's scan-out needs to be rotated
> by 180=C2=B0 in this case.
>
> Derek, yours panel-rotation patches add support for assigning panel's
> orientation to the connector, but then only primary display plane
> receives rotation value in [1], while rotation needs to be applied to
> all available overlay/cursor planes and this should happen in other
> places than [1] as well.

This is intended. We don't correct the output in the kernel. We
instead rely on notifying userspace that the panel is rotated, then we
handle it there.

>
> [1] drm_client_modeset_commit_atomic()
>
> Please also note that in a case of the scan-out rotation, plane's
> coordinates need to be changed in accordance to the display's rotation.
>
> I looked briefly through the DRM code and my understanding that the DRM
> core currently doesn't support use-case where scan-out needs to rotated
> based on a panel's orientation, correct? Is it the use-case you're
> working on for the Mediatek driver?

Yes, we rely on userspace to rotate the output. The major reason for
this is because there may not be a "free" hardware rotation that can
be applied to the overlay. Sean Paul and others also preferred that
userspace control what is output to the screen instead of the kernel
taking care of it. This code just adds the drm property to the panel.
