Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0AA41F745
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Oct 2021 00:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhJAWH4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 1 Oct 2021 18:07:56 -0400
Received: from mga12.intel.com ([192.55.52.136]:16946 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230171AbhJAWHz (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 1 Oct 2021 18:07:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="205080223"
X-IronPort-AV: E=Sophos;i="5.85,340,1624345200"; 
   d="scan'208";a="205080223"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 15:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,340,1624345200"; 
   d="scan'208";a="556591182"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by FMSMGA003.fm.intel.com with SMTP; 01 Oct 2021 15:05:47 -0700
Received: by stinkbox (sSMTP sendmail emulation); Sat, 02 Oct 2021 01:05:47 +0300
Date:   Sat, 2 Oct 2021 01:05:47 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Sean Paul <sean@poorly.run>
Cc:     Fernando Ramos <greenfoo@u92.eu>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/17] drm: cleanup: Use DRM_MODESET_LOCK_ALL_*
 helpers where possible
Message-ID: <YVeGOyLzuhN7zzV7@intel.com>
References: <20210924064324.229457-1-greenfoo@u92.eu>
 <20211001183655.GW2515@art_vandelay>
 <YVda4jNSGuQf50JV@intel.com>
 <20211001204815.GA2515@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211001204815.GA2515@art_vandelay>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 01, 2021 at 04:48:15PM -0400, Sean Paul wrote:
> On Fri, Oct 01, 2021 at 10:00:50PM +0300, Ville Syrj�l� wrote:
> > On Fri, Oct 01, 2021 at 02:36:55PM -0400, Sean Paul wrote:
> > > On Fri, Sep 24, 2021 at 08:43:07AM +0200, Fernando Ramos wrote:
> > > > Hi all,
> > > > 
> > > > One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
> > > > "use DRM_MODESET_LOCAL_ALL_* helpers instead of boilerplate". That's what this
> > > > patch series is about.
> > > > 
> > > > You will find two types of changes here:
> > > > 
> > > >   - Replacing "drm_modeset_lock_all_ctx()" (and surrounding boilerplate) with
> > > >     "DRM_MODESET_LOCK_ALL_BEGIN()/END()" in the remaining places (as it has
> > > >     already been done in previous commits such as b7ea04d2)
> > > > 
> > > >   - Replacing "drm_modeset_lock_all()" with "DRM_MODESET_LOCK_ALL_BEGIN()/END()"
> > > >     in the remaining places (as it has already been done in previous commits
> > > >     such as 57037094)
> > > >     
> > > > Most of the changes are straight forward, except for a few cases in the "amd"
> > > > and "i915" drivers where some extra dancing was needed to overcome the
> > > > limitation that the DRM_MODESET_LOCK_ALL_BEGIN()/END() macros can only be used
> > > > once inside the same function (the reason being that the macro expansion
> > > > includes *labels*, and you can not have two labels named the same inside one
> > > > function)
> > > > 
> > > > Notice that, even after this patch series, some places remain where
> > > > "drm_modeset_lock_all()" and "drm_modeset_lock_all_ctx()" are still present,
> > > > all inside drm core (which makes sense), except for two (in "amd" and "i915")
> > > > which cannot be replaced due to the way they are being used.
> > > > 
> > > > Changes in v2:
> > > > 
> > > >   - Fix commit message typo
> > > >   - Use the value returned by DRM_MODESET_LOCK_ALL_END when possible
> > > >   - Split drm/i915 patch into two simpler ones
> > > >   - Remove drm_modeset_(un)lock_all()
> > > >   - Fix build problems in non-x86 platforms
> > > > 
> > > > Fernando Ramos (17):
> > > >   drm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/i915: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/msm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() drm/vmwgfx: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/radeon: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/omapdrm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() part 2
> > > >   drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > > >   drm: cleanup: remove drm_modeset_(un)lock_all()
> > > >   doc: drm: remove TODO entry regarding DRM_MODSET_LOCK_ALL cleanup
> > > > 
> > > 
> > > Thank you for revising, Fernando! I've pushed the set to drm-misc-next (along
> > > with the necessary drm-tip conflict resolutions).
> > 
> > Ugh. Did anyone actually review the locking changes this does?
> > I shot the previous i915 stuff down because the commit messages
> > did not address any of it.
> 
> I reviewed the set on 9/17, I didn't see your feedback on that thread.

It was much earlir than that.
https://lists.freedesktop.org/archives/dri-devel/2021-June/313193.html

And I think I might have also shot down a similar thing earlier.

I was actually half considering sending a patch to nuke that
misleading TODO item. I don't think anything which changes
which locks are taken should be considred a starter level task.
And the commit messages here don't seem to address any of it.

-- 
Ville Syrj�l�
Intel
