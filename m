Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 883EF1ED718
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Jun 2020 21:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgFCTu7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 3 Jun 2020 15:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgFCTu7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Jun 2020 15:50:59 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE2FC08C5C0
        for <linux-tegra@vger.kernel.org>; Wed,  3 Jun 2020 12:50:58 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id m16so1687899ybf.4
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2020 12:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZEyEyEdu5zWmO0R2WmxHhzAVp9IwHZ3PJjcwh7vs5m4=;
        b=CQWsJPQhDizeaRlLOsbnTSO4MdBrCBkDDTAoOJcB9MweMq17vKWSNrySyXQTM8h/R3
         nXA07a4DxKs9SVyNvHK3NQDJWzGqMwuJZyJPhlvefrJHelYTAbzemc/EXLTt+s05uTFJ
         PjgMSfDK3F7CLZjJVo9HZ3mrczwJyMgIsUW3z0Yy1Gzn5ixo69cwN7Ouv8wQyb02QdMz
         u5Izgr0nbBtsspQrXp8WqABdVMOpWbHIJfsgXhJZz1Y0l2ea0mHst7U0tsXjjl7/8nxu
         K2QM1rzO1MWBnjpSFXzChhw5xXoU84I5nT7vP1l5VUwiMFFB/tYb2Rj7/QCs2lnQxlUh
         oong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZEyEyEdu5zWmO0R2WmxHhzAVp9IwHZ3PJjcwh7vs5m4=;
        b=o46KMeKeFfxFdbIyNbuYCv5L1IoZSMgLY/Iwdm1gbUrPKTAGfcn3WaBq8DUSC32XHH
         YstwrAwkleJHslR52gLJyHEwCUZf2m1E2DXsBA34z2hd0XJWRJO86J56HmqXNv4/3Kyj
         cXFGcWEF/ZIKNs3gjDkhAPAzLSv0ela2ODHjPDSwrKD497a2Tj8yW0oGLolPmf/XZH+O
         kUW3iWhRX1nxndGwwJX+K+h+xqJUE8GbgsZiDRTITdbpVQ4zsMxSPgIOR+DGNdG3e7cd
         54SG/ID1kth43cGL+l5F1dhbHSdUfsqsZgcrKkPQEmMeKwAdMIU5alfoFlYcXZMPkxAS
         uBAA==
X-Gm-Message-State: AOAM530g18JZKJ/xE60WPLyfeYSKcp/pMeJjEd0UEUzlCwDt+zdzZtkl
        mqTarDQVneHVd2vebCEekOL8bHs9Dg3tHWSx7J0=
X-Google-Smtp-Source: ABdhPJyGWrUhtxot8xwbLc0lAWIcEnJ3LXlTiHs5LNVjXXBQCio5c0BeQbfmM+WJ6+YhUDwAIAybpL++00AoiNi2Tfw=
X-Received: by 2002:a25:dd87:: with SMTP id u129mr2890055ybg.83.1591213857587;
 Wed, 03 Jun 2020 12:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200603142002.3776672-1-thierry.reding@gmail.com> <CACvgo529m+fub=ZddGkjRXEY-7i3rRUs0EssYGf+DJgkcDm3Zg@mail.gmail.com>
In-Reply-To: <CACvgo529m+fub=ZddGkjRXEY-7i3rRUs0EssYGf+DJgkcDm3Zg@mail.gmail.com>
From:   Ben Skeggs <skeggsb@gmail.com>
Date:   Thu, 4 Jun 2020 05:50:46 +1000
Message-ID: <CACAvsv7ecMSxhCTC6tJU63-aMJpoQn5-hkUpOjNFhJX1GAFQYQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: gr/gk20a: Use firmware version 0
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org,
        ML nouveau <nouveau@lists.freedesktop.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 4 Jun 2020 at 01:43, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Wed, 3 Jun 2020 at 15:20, Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Tegra firmware doesn't actually use any version numbers and passing -1
> > causes the existing firmware binaries not to be found. Use version 0 to
> > find the correct files.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>
> Fixes: ef16dc278ec2 ("drm/nouveau/gr/gf100-: select implementation
> based on available FW")
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Oops, my bad.  Merged.

Ben.

>
> -Emil
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
