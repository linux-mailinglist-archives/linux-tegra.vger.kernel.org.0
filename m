Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714BF34AA93
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Mar 2021 15:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhCZOyn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Mar 2021 10:54:43 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:41204 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCZOym (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:54:42 -0400
Date:   Fri, 26 Mar 2021 14:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1616770480;
        bh=nd47v5BzeRIUWkkPdAxVejmLEjjaNAlynsgoOb3JoC4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=kq90Au1ceaEFp64FSdolL7yI8gmuxPcK4Ssec6F3aZkdPaVM7GnystrN9bL+ugoKh
         BwYkm++Zok3hU3Sndip8LWpEPRt/QfkX1lAR2udMbfh6magHdc2Xpv9D7gzSwOoyNf
         zW8fTLQmWMpg02i3Vz2XJxUQ6KKYETpvK6l8pMZjQFbdSf641qcq4ujmJapk7hCMgA
         IgRqfe30PSQNCyBZNAJCyHvIc/o7+JJjrVg4kOlOGhbS3Yd9uJCDuFOadPtixv/NIE
         dDryZPtk6HeSxoUsJQJs7yjAhWfJ4RjmZD9ZOwNNSSPyxm3+RqNbLSXmjveaUMxtA0
         oCbpM9kwgp/oQ==
To:     Thierry Reding <thierry.reding@gmail.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        James Jones <jajones@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the modifier vendor
Message-ID: <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
In-Reply-To: <20210326145139.467072-2-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com> <20210326145139.467072-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

LGTM, thanks!

Reviewed-by: Simon Ser <contact@emersion.fr>

Let me know if you need me to push this to drm-misc-next.
